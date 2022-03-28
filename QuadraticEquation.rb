class Equation
  attr_accessor :a, :b, :c, :d, :x1, :x2

  def initialize a, b, c
    @a = a
    @b = b
    @c = c
    @d = b**2 - 4*a*c
    #square roots for a and b respectively
    @x1 = Math.sqrt a 
    @x2 = Math.sqrt b
  end

  def calculate
    if d > 0
      return "Discriminant: #{d}, a's Root: #{x1}, b's Root: #{x2}"
    elsif d == 0
      return "Discriminant: #{d}, Root: #{x1}"
    elsif d < 0
      return "Discriminant: #{d}, No Roots!"
    end
  end
end

puts Equation.new(1, 20, 3).calculate