class VowelHash
  
  def initialize 
    @result = {}
    @alphabet = ("a".."z").to_a
    @vowels = ["a", "e", "i", "o", "u", "y"]
  end

  def calculate
    @alphabet.each do |char|
      if @vowels.include? char
        @result[char] = @alphabet.index(char) + 1
      end
    end
    @result
  end
end

obj1 = VowelHash.new
puts obj1.calculate
