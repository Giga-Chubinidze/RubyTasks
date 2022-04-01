class ShoppingCart
  def initialize
    @result = {}
    @result_string = []
    @total_price = 0
  end

  def calculate
    assignment
    puts @result
    puts @result_string
    puts "Total price: #{@total_price}"
  end

  def assignment
    loop do
      puts 'Enter name | Enter stop to break out of the loop'
      name = gets.chomp
      break if name == 'stop'

      console_input

      @result[name] = { "Price": @price, "Quantity": @quantity }
      @result_string << "Item: #{name}, Total Amount: #{@price * @quantity}"
      @total_price += @price * @quantity
    end
  end

  def console_input
    puts 'Enter price'
    @price = gets.chomp.to_f

    loop do
      break if @price != 0.0

      puts 'Enter price'
      @price = gets.chomp.to_f
    end

    puts 'Enter quantity'
    @quantity = gets.chomp.to_i

    loop do
      break if @quantity != 0

      puts 'Enter quantity'
      @quantity = gets.chomp.to_i
    end
  end
end

object1 = ShoppingCart.new
object1.calculate
