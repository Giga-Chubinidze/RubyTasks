# frozen_string_literal: true

class VowelHash
  def calculate
    result = {}
    alphabet = ('a'..'z').to_a
    vowels = %w[a e i o u y]

    alphabet.each do |char|
      result[char] = alphabet.index(char) + 1 if vowels.include? char
    end
    result
  end
end

obj1 = VowelHash.new
puts obj1.calculate
