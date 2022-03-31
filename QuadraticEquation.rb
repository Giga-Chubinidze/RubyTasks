class Equation
  attr_accessor :first_val, :second_val, :third_val, :discriminant, :first_root, :second_root, :sqrt_val

  def initialize(first_val, second_val, third_val)
    @first_val = first_val
    @second_val = second_val
    @third_val = third_val
    @discriminant = second_val**2 - 4 * first_val * third_val

    #square roots for a and b respectively
    @first_root = Math.sqrt first_val 
    @second_root = Math.sqrt second_val

    @sqrt_val = Math.sqrt discriminant.abs
  end

  def calculate
    if discriminant > 0
      return "Discriminant: #{discriminant}, a's Root: #{(-second_val + sqrt_val) / (2 * first_val)}, 
                                             b's Root: #{(-second_val - sqrt_val) / (2 * first_val)}"
    elsif discriminant == 0
      return "Discriminant: #{discriminant}, Root: #{-second_val / (2 * first_val)}"
    else
      return "Discriminant: #{discriminant}, No Roots!"
    end
  end
end


puts "Input first side"
first_val = gets.chomp.to_f
puts "Input second side"
second_val = gets.chomp.to_f
puts "Input third side"
third_val = gets.chomp.to_f

obj1 = Equation.new(first_val, second_val, third_val)
puts obj1.calculate
