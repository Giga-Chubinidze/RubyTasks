class Triangle
  VALUE = 0.5
  def calculate base, height
    VALUE*base*height
  end
end

obj1 = Triangle.new.calculate 10, 5
puts obj1