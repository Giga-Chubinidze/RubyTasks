class GreaterThanFive
  class GigasIOError < StandardError; end

  def initialize(array)
    @array = array
  end

  def call
    input_validation
    item_counter
  rescue GigasIOError => e
    warn e
  end

  private

  def item_counter
    result = []
    @array.each do |i|
      result << i if i > 5
    end
    result
  end

  def input_validation
    unless (@array.is_a? Array) && (@array.all? do |i|
      i.is_a?(Integer) || i.is_a?(Float)
    end)
      raise GigasIOError, 'Invalid Input'
    end
  end
end

obj1 = GreaterThanFive.new([4, 3, 9, 2, 25, 7])
puts obj1.call
