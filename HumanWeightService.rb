class HumanWeightService
  class GigasIOError < StandardError; end
  
  VALUE = 110

  def initialize
    puts 'Enter Your Name'
    @name = gets.chomp
    puts 'Enter Your Height'
    @height = gets.chomp
  end

  def call 
    check_string(@height)
    calculate
    rescue GigasIOError => e
      warn e 
  end
  
  private

  def calculate
    @height = @height.to_i
    @weight = @height - VALUE
    if @height < VALUE
      "#{@name}, Your Weight Is Already Optimal"
    else
      "#{@name}, Your Ideal Weight Is: #{@weight}"
    end
  end

  def check_string(string)
    return if string.scan(/\D/).empty?
    raise GigasIOError, "You Entered Invalid Height"
  end
end

obj1 = HumanWeightService.new.call 
puts obj1
