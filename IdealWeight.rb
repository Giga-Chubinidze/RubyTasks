class HumanWeight
  VALUE = 110
  
  def initialize
    puts "Enter Your Name"
    @name = gets.chomp
    puts "Enter Your Height"
    @height = gets.chomp.to_i
  end
  
  def calculate
    @weight = @height - VALUE
    @height < VALUE ? "#{@name}, Your Weight Is Already Optimal": 
                      "#{@name}, Your Ideal Weight Is: #{@weight}"
  end
end

obj1 = HumanWeight.new.calculate
puts obj1
