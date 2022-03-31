class Triangle
  attr_accessor :side_a, :side_b, :side_c

  def initialize(side_a, side_b, side_c)
    @side_a = side_a
    @side_b = side_b
    @side_c = side_c
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
    sides = [side_a, side_b, side_c]
    sides.sort!
    hypotenuse = sides[2]
    hypotenuse**2 == sides[0]**2 + sides[1]**2
  end

  def isosceles?
    sides = [side_a, side_b, side_c]
    sides.uniq.length != sides.length
  end

  def all_sides_equal?
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
