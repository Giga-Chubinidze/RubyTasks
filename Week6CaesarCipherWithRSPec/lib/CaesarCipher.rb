class CaesarCipher
  class InputOutputError < StandardError; end

  ASCII_UPPER_VAL = 65
  ASCII_LOWER_VAL = 97
  ALPHABET_SIZE = 26
  MISC_CHARS = ['.', ',', '!', '?', ' '].freeze

  def initialize(text, key)
    @text = text
    @key = key
  end

  def call
    input_validation
    encrypt
  rescue InputOutputError => e
    warn e
  end

  private

  def encrypt
    res = []
    @text.each_char do |i|
      if MISC_CHARS.include? i
        res.append(i)
      elsif uppercase?(i)
        res.append(((i.ord + @key - ASCII_UPPER_VAL) % ALPHABET_SIZE + ASCII_UPPER_VAL).chr)
      elsif lowercase?(i)
        res.append(((i.ord + @key - ASCII_LOWER_VAL) % ALPHABET_SIZE + ASCII_LOWER_VAL).chr)
      end
    end
    res.join
  end

  def uppercase?(char)
    char == char.upcase
  end

  def lowercase?(char)
    char == char.downcase
  end

  def input_validation
    raise InputOutputError, 'Invalid Input' unless @text.is_a? String
  end
end
