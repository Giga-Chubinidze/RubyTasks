class Triangle
  attr_accessor :a, :b, :c

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def calculate
    if pythagorean?
      if isosceles?
        'It is Pythagorean And Isosceles!'
      else
        'It is Pythagorean!'
      end
    elsif all_sides_equal?
      'It is Isosceles And Equillateral'
    end
  end

  def pythagorean?
    sides = [a, b, c]
    sides.sort!
    hypotenuse = sides[2]
    hypotenuse**2 == sides[0]**2 + sides[1]**2
  end

  def isosceles?
    sides = [a, b, c]
    sides.uniq.length != sides.length
  end

  def all_sides_equal?
    sides = [a, b, c]
    a == b && b == c
  end
end

puts "Input first side"
a = gets.chomp.to_f
puts "Input second side"
b = gets.chomp.to_f
puts "Input third side"
c = gets.chomp.to_f

obj1 = Triangle.new(a, b, c)
puts obj1.calculate