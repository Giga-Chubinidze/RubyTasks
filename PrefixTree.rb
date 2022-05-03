class Node
  attr_accessor :data, :is_word

  def initialize
    @data = {}
    @is_word = false
  end
end

class PrefixTree
  attr_accessor :root

  def initialize
    @root = Node.new
  end

  def add(word)
    current = root
    word.each_char do |char|
      if current.data.include?(char)
        current = current.data[char]
      else
        new_node = Node.new
        current.data[char] = new_node
        current = new_node
      end
    end
    current.is_word = true
    current
  end

  def include?(prefix)
    current = root
    prefix.each_char do |char|
      if current.data.include?(char)
        current = current.data[char]
      else
        return false
      end
    end
    true
  end

  def find(prefix)
    current = root
    prefix.each_char do |char|
      if current.data.include?(char)
        current = current.data[char]
      else
        return false
      end
    end
    current.is_word
  end

  def list
    root.data
  end

  def delete(word)
    delete_word(word, 0, root)
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

  def delete_word(word, index, root)
    current = root

    word_exists?(word, index, current)

    char = word[index]
    return false unless current.data.include?(char)

    next_node = current.data[char]
    should_delete_ref = delete_word(word, index + 1, next_node)

    delete_reference(current, char, should_delete_ref)
    false
  end
end

trie = PrefixTree.new
trie.add('apple')
trie.add('apple')
trie.add('giga')
trie.add("trip")
puts trie.include?('apps')
puts trie.find('apple')
puts trie.find('giga')
trie.delete('giga')
puts trie.find('giga')




