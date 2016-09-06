module Ruigi
  class Parser
    require 'nkf'

    class << self
      def wakati(sentence)
        # TODO: enable to change another dictionary
        nm = Natto::MeCab.new('-d /usr/local/lib/mecab/dic/mecab-ipadic-neologd')
        words = []
        normalized_sentence = normalize(sentence)
        nm.parse(normalized_sentence) do |word|
          next if word.surface.empty?
          features = word.feature.split(',')
          part_of_speech = features.first
          if ENABLED_PARTS_OF_SPEECH.include?(part_of_speech)
            if features[6] == "*"
              if EXCEPT_REGEXP.none? { |pattern| word.surface.match(pattern) }
                words << word.surface
              end
            else
              if EXCEPT_REGEXP.none? { |pattern| features[6].match(pattern) }
                words << features[6]
              end
            end
          end
        end
        words
      rescue => e
        # TODO?: error handling
      end

      def english(sentence)
        sentence.split
      end

      private
      def normalize(sentence)
        NKF.nkf('-m0Z1 -w -W', sentence)
      end
    end
  end
end
