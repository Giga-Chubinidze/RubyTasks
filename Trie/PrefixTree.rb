require_relative "PrefixTreeNode"

class PrefixTree
  attr_accessor :root, :container

  def initialize
    @root = Node.new
    @container = []
  end

  def add(word)
    container << word
    current = root
    word.each_char do |char|
      current = adder_logic(current, char)
    end
    current.is_word = true
    current
  end

  def adder_logic(current, char)
    if current.data.include?(char)
      current = current.data[char]
    else
      new_node = Node.new
      current.data[char] = new_node
      current = new_node
    end
    current
  end

  def include?(prefix)
    current = root
    prefix.each_char do |char|
      return false unless current.data.include?(char)
      current = current.data[char]
    end
    true
  end

  def find(prefix)
    current = root
    prefix.each_char do |char|
      return false unless current.data.include?(char)
      current = current.data[char]
    end
    current.is_word
  end

  def list(prefix = nil)
    res = []
    return root.data if prefix.nil?
    return verified_words(container, prefix)
  end

  def verified_words(container, prefix)
    res = []
    container.each do |word|
      res << word if word.start_with?(prefix)
    end
    res.length == 0 ? false : res
  end

  def delete(word)
    delete_recursively(word, 0, root)
  end

  private

  def word_exists?(word, index, current)
    if index == word.length
      return false unless current.is_word

      current.is_word = false
      current.data.length.zero?
    end
  end

  def delete_reference(current, char, should_delete_ref)
    if should_delete_ref
      current.data.delete(char)
      current.data.length.zero?
    end
  end

  def delete_recursively(word, index, root)
    current = root

    word_exists?(word, index, current)

    char = word[index]
    return false unless current.data.include?(char)

    next_node = current.data[char]
    should_delete_ref = delete_recursively(word, index + 1, next_node)

    delete_reference(current, char, should_delete_ref)
    false
  end
end


trie = PrefixTree.new

trie.add("qwerty")
trie.add("qwcb")
trie.add("cat")
trie.add("dog")
trie.add("doggoro")
trie.add("dolphin")

puts trie.list("do")