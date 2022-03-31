class ShoppingCart
  
  def initialize
    @result = {}
    @result_string = []
    @total_price = 0
  end

  def calculate
    console_input
    puts @result
    puts @result_string
    puts "Total price: #{@total_price}"
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
      @result[name] = {"Price": price, "Quantity": quantity}
      @result_string << "Item: #{name}, Total Amount: #{price * quantity}"
      @total_price += price * quantity
    end
  end
end

object1 = ShoppingCart.new
object1.calculate
