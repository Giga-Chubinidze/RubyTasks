class SubString
  class InputOutputError < StandardError; end

  def initialize(str, lst)
    @str = str
    @lst = lst
  end

  def call
    input_validation
    to_down_case
    substring_finder
  rescue InputOutputError => e
    warn e
  end

  private

  def substring_finder
    ans = {}
    @lst.each do |i|
      ans[i] = @str.scan(i).count if @str[i]
    end
    ans
  end

  def input_validation
    raise InputOutputError, 'Invalid Input' unless @str.is_a?(String) && @lst.is_a?(Array)
  end

  def to_down_case
    @str = @str.downcase
    @lst.collect(&:downcase)
  end
end

str = "Howdy partner, sit down, how's it going?"
lst = %w[below down go going horn how howdy it i low own part partner sit]

obj1 = SubString.new(str, lst)
puts obj1.call



