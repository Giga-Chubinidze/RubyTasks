class FibSum
  class InputOutputError < StandardError; end

  def initialize(tail_num)
    @tail_num = tail_num
    @first = 0
    @second = 1
    @result = []
  end

  def call
    input_validation
    even_num_sum
  rescue InputOutputError => e
    warn e 
  end

  private

  def fib_array 
    while @first <= @tail_num
        @result << @first
        @after = @first + @second
        @first = @second
        @second = @after
    end
    @result
  end

  def even_num_sum
    fib_array.select(&:even?).reduce(:+)
  end

  def input_validation
    raise InputOutputError, 'Invalid Input' unless @tail_num.is_a?(Integer) && @tail_num > 0
  end
end


obj1 = FibSum.new(100)
puts obj1.call



