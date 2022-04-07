class SumOfDigits
  class GigasIOError < StandardError; end

  def initialize(starting_num, ending_num)
    @starting_num = starting_num
    @ending_num = ending_num
  end

  def call
    input_validation
    summation
  rescue GigasIOError => e
    warn e
  end

  private 

  def summation
    (@starting_num..@ending_num).sum
  end

  def input_validation
    raise GigasIOError, 'Invalid Input' unless 
       (@starting_num.is_a? Integer) && (@ending_num.is_a? Integer) &&
       (@starting_num < @ending_num)
  end
end

obj1 = SumOfDigits.new(1, 10)
puts obj1.call