module Ruigi
  class Model
    attr_accessor :corpus

    def initialize(corpus)
      raise TypeError unless corpus.is_a?(Array)
      raise TypeError unless corpus.all? { |e| e.is_a?(Ruigi::Document) }

      self.corpus = corpus

      corpus.each do |document|
        document.model = self
      end
    end

    def matrix
      @matrix ||= corpus.map(&:feature_vector).to_nm
    end

    def feature_vector_of(index)
      corpus[index].feature_vector.to_nm
    end

    def wordlist
      @wordlist ||= corpus.map { |document| document.words.keys }.flatten.uniq.sort
    end

    def inner_product_matrix
      matrix.dot(matrix.transpose)
    end
  end
end
