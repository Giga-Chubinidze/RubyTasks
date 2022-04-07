class StringIndices
  class GigasIOError < StandardError; end

  def initialize(str)
    @str = str
  end

  def call
    input_validation
    index_mapper
  rescue GigasIOError => e
    warn e
  end

  private

  def index_mapper
    @str.each_char.with_index.with_object({}) do |(c, i), h|
      (h[c] ||= []) << i
    end
  end

  def input_validation
    raise GigasIOError, 'Invalid Input' unless @str.is_a? String
  end
end

obj1 = StringIndices.new("dodo")
puts obj1.call
