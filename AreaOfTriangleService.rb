VALUE = 0.5

class Triangle
  class GigasIOError < StandardError; end

  def initialize(base, height)
    @base = base
    @height = height
  end

  def call(method_name)
    input_check
    method(method_name).call
  rescue GigasIOError => e
    warn e
  end

  private

  def area
    VALUE * @base * @height
  end

  def circumference
    # a test method to check the functionality
    'i am circumference'
  end

  def input_check
    raise GigasIOError, 'Invalid Input' if @base != 0 || @height != 0
  end
end

obj1 = Triangle.new(10, 0)
puts obj1.call(:area)
