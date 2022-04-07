class LargestWord
  LIST = ['Ruby', 'Python', 'Java', '.NET', 'HTML', 'JavaScript'].freeze

  def call
    longest_component
  end

  private

  def longest_component
    LIST.inject do |fst, snd|
      fst.length > snd.length ? fst : snd
    end
  end
end

obj1 = LargestWord.new
puts obj1.call
