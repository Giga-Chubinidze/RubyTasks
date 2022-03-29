# frozen_string_literal: true

class FibArray
  def calculate
    first = 0
    second = 1
    result = []
    while first <= 100
      result << first
      after = first + second
      first = second
      second = after
    end
    result
  end
end

obj1 = FibArray.new
puts obj1.calculate
