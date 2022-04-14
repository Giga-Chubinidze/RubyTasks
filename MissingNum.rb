class MissingNum
  class InputOutputError < StandardError; end

  MAX_NUM = 9
  MAX_LEN = 9
  MIN_NUM = 2

  def initialize(array)
    @array = array
  end

  def call
    input_validation
    find_missing_num
  rescue InputOutputError => e
    warn e
  end

  private 
  
  def find_missing_num
    res = 0
    (1..10).each do |i|
      res = i if @array.include?(i) == false
    end
    res
  end

  def input_validation
    raise InputOutputError, 'Invalid Input' unless @array.is_a?(Array) && one_to_ten?
  end

  def one_to_ten?
    @array.max >= MAX_NUM && (@array.min <= MIN_NUM) && @array.length == MAX_LEN
  end
end

obj1 = MissingNum.new([1, 2, 3, 4, 5, 6, 8, 9, 10])
puts obj1.call



