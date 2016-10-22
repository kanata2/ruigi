module Ruigi
  class Document
    extend Forwardable

    attr_accessor :model, :words

    def_delegator :model, :wordlist, :all_words

    def initialize(words)
      raise TypeError unless words.is_a?(Array)
      raise TypeError unless words.all? { |e| e.is_a?(String) }

      self.words = Hash.new
      words.group_by { |e| e }.each do |k, v|
        word = Ruigi::Word.new(k, v.length)
        word.document = self
        self.words[k] = word
      end
    end

    def feature_vector
      @feature_vector ||=
        begin
          vector = all_words.map { |word| words.keys.include?(word) ? words[word].tfidf : 0.0 }
          norm = Math.sqrt(vector.inject(0) { |sum, e| sum + e ** 2 })
          vector.map do |e|
            quot = e / norm
            quot.nan? ? 0.0 : quot
          end
        end
    end
  end
end
