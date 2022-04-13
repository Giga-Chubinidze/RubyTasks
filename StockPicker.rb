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

  def profitable_days
    buy_day =
    sell_day =
    best_profit =
    profit = 0
    
    for i in 0..@stock_array.length - 2
      profit = @stock_array[i + 1..-1].max - @stock_array[i]
      if profit > best_profit
        best_profit = profit
        buy_day = i
        sell_day = @stock_array.index(@stock_array[i + 1..-1].max)
      end	
    end	
    [buy_day, sell_day].to_s
  end

  def input_validation
    raise InputOutputError unless @stock_array.is_a? Array
  end
end


obj1 = StockPicker.new([17,3,6,9,15,8,6,1,10])

puts obj1.call
i 