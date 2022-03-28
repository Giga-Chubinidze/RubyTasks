class FillArray
  def calculate
    result = []
    (10..100).step(5) do |i|
      result << i
    end
    result
  end
end

obj1 = FillArray.new
puts obj1.calculate