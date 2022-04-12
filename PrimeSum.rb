class PrimeFinder
  class GigasIOError < StandardError; end

  def initialize(array)
    @array = array
  end

  def call
    input_validation
    prime_sum
  rescue GigasIOError => e
    warn e
  end

  private

  def prime_sum
    prime_num = 0
    @array.each do |i|
      prime_num += i if is_prime?(i)
    end
    prime_num
  end

  def is_prime?(num, div = 2)
    if num <= 2
      return false if num == 1
      return true if num == 2 else false
    end
    return false if (num % div).zero?
    return true if div * div > num

    is_prime?(num, div + 1)
  end

  def input_validation
    unless @array.all? do |i|
      i.is_a? Integer
    end
      raise GigasIOError, 'Invalid Input'
    end
  end
end

obj1 = PrimeFinder.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
puts obj1.call
