class HumanWeight
  VALUE = 110
  
  def calculate
    puts "Enter Your Name"
    name = gets.chomp
    puts "Enter Your Height"
    height = gets.chomp.to_i
    weight = height - VALUE
  return height < VALUE ? "Your Weight Is Already Optimal": "Your Ideal Weight Is: #{weight}"
  end
end

obj1 = HumanWeight.new.calculate
puts obj1
