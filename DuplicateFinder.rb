class DuplicateFinder
  class GigasIOError < StandardError; end

  def initialize(list)
    @list = list
  end

  def call
    input_validation(@list)
    duplicate_elements
  rescue GigasIOError => e
    warn e
  end

  private

  def duplicate_elements
    (@list.find_all do |e| @list.count(e) > 1 end).uniq.to_s
  end

  def input_validation(obj)
    obj.each do |elem|
      raise GigasIOError, 'Invalid Input' unless elem.to_i.to_s == elem && obj.length > 1
    end
  end
end

## ----------------------------------------------------- TESTING

numbers = []
loop do
  puts "Enter a number | Enter 's' to stop the process!"
  input = gets.chomp
  break if input == 's' 

  numbers << input
end

obj1 = DuplicateFinder.new(numbers)
puts obj1.call
