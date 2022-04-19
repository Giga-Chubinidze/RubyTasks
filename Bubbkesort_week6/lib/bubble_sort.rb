class BubbleSort
  class InputOutputError < StandardError; end
  attr_accessor :arr

  def initialize(arr)
    @arr = arr
  end

  def call
    input_validation
    sort
  rescue InputOutputError => e
    e.message
  end

  private

  def sort
    (0...arr.length).each do
      (1..(arr.length - 1)).each do |idx|
        next unless arr[idx - 1] > arr[idx]

        arr[idx - 1], arr[idx] = arr[idx], arr[idx - 1]
      end
    end
    arr
  end

  def all_elem_integer?
    (arr.all? do |i|
      i.is_a? Integer
    end)
  end

  def input_validation
    raise InputOutputError, 'Invalid Input' unless arr.is_a?(Array) && all_elem_integer?
  end
end



