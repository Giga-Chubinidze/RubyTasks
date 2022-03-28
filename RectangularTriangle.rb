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

# an example of a triangle with 3 equal sides!
obj1 = Triangle.new(9, 9, 9)
puts obj1.calculate
