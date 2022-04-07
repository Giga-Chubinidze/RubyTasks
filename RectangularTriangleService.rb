class Triangle
  class GigasIOError < StandardError; end

  attr_accessor :side_a, :side_b, :side_c

  def initialize(side_a, side_b, side_c)
    @side_a = side_a
    @side_b = side_b
    @side_c = side_c
  end

  def call
    input_check
    calculate
  rescue GigasIOError => e
    warn e
  end

  private

  def calculate
    if pythagorean? && isosceles?
      'It is Pythagorean And Isosceles!'
    elsif pythagorean?
      'It is Pythagorean!'
    elsif all_sides_equal?
      'It is Isosceles And Equillateral'
    else
      'Undefined'
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
    side_a == side_b && side_b == side_c
  end

  def input_check
    raise GigasIOError, 'Invalid Input' if side_a.zero? || side_b.zero? || side_c.zero?
  end
end

puts 'Input first side'
a = gets.chomp.to_f
puts 'Input second side'
b = gets.chomp.to_f
puts 'Input third side'
c = gets.chomp.to_f

obj1 = Triangle.new(a, b, c)
puts obj1.call
