module Ruigi
  ENABLED_PARTS_OF_SPEECH = %w(
    名詞
    形容詞
    動詞
  ).map(&:freeze).freeze

  EXCEPT_REGEXP = %w(
    \\A\\p{hiragana}る\\z
    \d+
  ).map { |pattern| Regexp.new(pattern).freeze }.freeze

end
