class Equation
  attr_accessor :a, :b, :c, :d, :x1, :x2, :sqrt_val

  def initialize a, b, c
    @a = a
    @b = b
    @c = c
    @d = b**2 - 4*a*c
    
    #square roots for a and b respectively
    @x1 = Math.sqrt a 
    @x2 = Math.sqrt b

    @sqrt_val = Math.sqrt(d.abs)
  end

  def calculate
    if d > 0
      return "Discriminant: #{d}, a's Root: #{(-b + sqrt_val) / (2 * a)}, b's Root: #{(-b - sqrt_val) / (2 * a)}"
    elsif d == 0
      return "Discriminant: #{d}, Root: #{-b / (2 * a)}"
    elsif d < 0
      return "Discriminant: #{d}, No Roots!"
    end
  end
end


puts "Input first side"
a = gets.chomp.to_f
puts "Input second side"
b = gets.chomp.to_f
puts "Input third side"
c = gets.chomp.to_f

obj1 = Equation.new(a, b, c)
puts obj1.calculate