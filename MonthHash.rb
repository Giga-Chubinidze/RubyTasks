# frozen_string_literal: true

require 'date'

class MonthHash
  def calculate
    month_arr = Date::MONTHNAMES
    valid_months = []
    (1...12).each do |i|
      valid_months << month_arr[i] if Date.civil(2022, i, -1).day == 30
    end
    valid_months
  end
end

obj1 = MonthHash.new
puts obj1.calculate
