require 'date'

class MonthHash
  
  def initialize
    @month_arr = Date::MONTHNAMES
    @valid_months = []
  end
  
  def days_in_month(month)
    (Date.new(2022, 12, 31) << (12 - month)).day
  end

  def calculate
    (1...12).each do |i|
      @valid_months << @month_arr[i] if Date.civil(2022, i, -1).day == 30
    end
    @valid_months
  end
end

obj1 = MonthHash.new
puts obj1.calculate
