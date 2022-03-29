class Ordinalize
  @@days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

  def initialize(day, month, year)
    @day = day
    @month = month
    @year = year
  end

  def calculate
    # Re declaring initialized variables in this method, so i dont override
    # its original values
    @day += 1 if isLeap?
    "#{ordinalize(day_adder)} Day of the year"
  end

  def day_adder
    # Add the days in the previous months
    @month -= 1
    while @month.positive?
      @day += @@days[@month - 1]
      @month -= 1
    end
    @day
  end

  def ordinalize(num)
    if (11..13).include?(num % 100)
      "#{num}th"
    else
      case num % 10
      when 1 then "#{num}st"
      when 2 then "#{num}nd"
      when 3 then "#{num}rd"
      else "#{num}th"
      end
    end
  end

  def isLeap?
    # If current year is a leap year and the date
    # given is after the 28th of February then
    # it must include the 29th February
    @month > 2 && (@year % 4).zero? && (@year % 100 != 0 || (@year % 400).zero?)
  end
end

puts 'Enter day'
day = gets.chomp.to_i
puts 'Enter month'
month = gets.chomp.to_i
puts 'Enter year'
year = gets.chomp.to_i

object1 = Ordinalize.new(day, month, year)
puts object1.calculate