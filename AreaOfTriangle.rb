class Triangle
  def calculate base, height
    0.5*base*height
  end
end

obj1 = Triangle.new.calculate 10, 5
puts obj1