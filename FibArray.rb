class FibArray

  def initialize
    @first = 0
    @second = 1
    @result = []
  end
  
  def calculate 
    while @first <= 100
        @result << @first
        @after = @first + @second
        @first = @second
        @second = @after
    end
    @result
  end
end

obj1 = FibArray.new
puts obj1.calculate

