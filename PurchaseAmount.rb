class ShoppingCart
  def initialize
    @result = {}
    @result_string = []
  end

  def calculate
    console_input
    puts @result
    puts @result_string
  end

  def console_input
    loop do
      puts 'Enter name | Enter stop to break out of the loop'
      name = gets.chomp
      break if name == 'stop'

      puts 'Enter price'
      price = gets.chomp.to_f
      puts 'Enter quantity'
      quantity = gets.chomp.to_i
      @result[name] = "Price: #{price}, Quantity: #{quantity}"
      @result_string << "Item: #{name}, Total Amount: #{price * quantity}"
    end
  end
end

object1 = ShoppingCart.new
object1.calculate