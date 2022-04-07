class LengthCounter
  LIST = ['Ruby', 'Python', 'Java', '.NET', 'HTML', 'JavaScript'].freeze

  def call
    each_element_len
  end

  private

  def each_element_len
    LIST.each_with_object({}) do |element, hash|
      hash[element] = element.length
    end
  end
end

obj1 = LengthCounter.new
puts obj1.call
