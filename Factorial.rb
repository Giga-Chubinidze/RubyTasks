class Factorial
  class InputOutputError < StandardError; end

  def initialize(input)
    @input = input
  end

  def call
    input_validation
    factorial(@input)
  rescue InputOutputError => e
    warn e
  end

  private

  def factorial(num)
    if num == 0
      return 1
    end
    return num * factorial(num - 1)
  end

  def input_validation
    unless @input.is_a?(Integer) && (@input.positive? || @input.zero?)
      raise InputOutputError, 'Invalid Input'
    end
  end
end

obj1 = Factorial.new(5)
puts obj1.call
