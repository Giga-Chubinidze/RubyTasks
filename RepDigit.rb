class RepDigit
  class InputOutputError < StandardError; end

  def initialize(number)
    @number = number
  end

  def call
    input_validation
    rep_digit?
  rescue InputOutputError => e
    warn e
  end

  def rep_digit?
    @number.to_s.split("").uniq.length == 1
  end

  def input_validation
    raise InputOutputError, 'Invalid Input' unless @number.is_a? Integer
  end

end

obj1 = RepDigit.new(11111)
puts obj1.call