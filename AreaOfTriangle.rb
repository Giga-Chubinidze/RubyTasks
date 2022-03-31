class Triangle
  VALUE = 0.5
  
  def initialize base, height
    @base = base
    @height = height
  end
  
  def calculate
    VALUE * @base * @height
  end
end

obj1 = Triangle.new(10, 5)
puts obj1.calculate
