module Ruigi
  class Word
    extend Forwardable

    attr_accessor :document, :count, :name

    def_delegator :document, :model, :involved_model

    def initialize(name, count)
      self.name = name
      self.count = count
    end

    def tfidf
      tf * idf
    end

    def tf
      raise NoDocumentError unless document

      document_length = document.words.inject(0) { |sum, (k, v)| sum + v.count }
      count.to_f / document_length
    end

    def df
      raise NoModelError unless involved_model

      involved_model.corpus.count { |document| document.words[name] != nil }
    end

    def idf
      df2idf(df)
    end

    private

    def df2idf(df, base = 2.0, add = 0.0)
      Math.log(involved_model.corpus.size.to_f / df, base) + add
    end
  end
end
