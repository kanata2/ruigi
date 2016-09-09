require 'nmatrix'

module Ruigi
  class Document
    extend Forwardable

    attr_accessor :model, :words, :title

    def_delegator :model, :wordlist, :all_words

    def initialize(title, words)
      raise TypeError unless words.is_a?(Array)

      @title = title
      @words = Hash.new
      words.group_by { |e| e }.each do |k, v|
        word = Ruigi::Word.new(k, v.length)
        word.document = self
        @words[k] = word
      end
    end

    def feature_vector
      @feature_vector ||=
        begin
          vector = all_words.map { |word| words.keys.include?(word) ? words[word].tfidf : 0.0 }
          norm = Math.sqrt(vector.map { |e| e ** 2 }.inject(:+))
          vector.map do |e|
            quot = e / norm
            quot.nan? ? 0.0 : quot
          end
        end
    end
  end
end
