def calculate
    puts "Enter Your Name"
    name = gets.chomp
    puts "Enter Your Height"
    height = gets.chomp.to_i
    weight = height - 110
    puts height < 110 ? "Your Weight Is Already Optimal": "Your Ideal Weight Is: #{weight}"
end

calculate