module Ruigi
  ENABLED_PARTS_OF_SPEECH = %w(
    名詞
    形容詞
    動詞
  ).map(&:freeze).freeze

  EXCEPT_REGEXP = %r(
    \\A\\p{hiragana}る\\z
    \d+
  ).freeze
end
