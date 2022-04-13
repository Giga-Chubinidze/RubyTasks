class StockPicker
  class InputOutputError < StandardError; end

  def initialize(stock_array)
    @stock_array = stock_array
  end

  def call
    input_validation
    profitable_days
  rescue InputOutputError => e
    warn e
  end

  private 

  def profitable_days
    buy =
    sell =
    best_profit =
    profit = 0

    (0..@stock_array.length - 2).each do |i|
      profit = @stock_array[i + 1..-1].max - @stock_array[i]
      next unless profit > best_profit

      best_profit = profit
      buy = i
      sell = @stock_array.index(@stock_array[i + 1..-1].max)
    end
    [buy, sell].to_s
  end

  def all_elem_integer?
    (@stock_array.all? do |i|
      i.is_a? Integer
    end)
  end

  def input_validation
    raise InputOutputError, 'Invalid Input' unless all_elem_integer? && @stock_array.is_a?(Array)
  end
end

obj1 = StockPicker.new([17, 3, 6, 9, 15, 8, 6, 1, 10])

puts obj1.call



