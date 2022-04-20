module Enumerable

  def my_all?
    array = is_a?(Range) ? to_a : self
    flag = true

    array.my_each do |item|
      return false unless yield(item)
    end
    flag
  end

  def my_any?
    array = is_a?(Range) ? to_a : self
    flag = false

    array.my_each do |item|
      return true if yield(item)
    end
    flag
  end

  def my_count(arg = nil)
    array = is_a?(Range) ? to_a : self

    if arg
      return array.my_select { |val| val if val == arg }.length
    end

    count = array.length

    return count unless block_given?

    array.my_each do |item|
      count -= 1 unless yield(item)
    end
    count
  end

  def my_each_with_index
    return enum_for unless block_given?

    array = is_a?(Range) ? to_a : self
    index = -1
    array.my_each { |item| yield(item, index += 1) }
    self
  end

  def my_inject(init = nil, symbol = nil)
    ary = is_a?(Range) ? to_a : self

    acc = init

    if !init || init.is_a?(Symbol)
      acc = ary[0]
      array = ary.slice(1, ary.length - 1)
    else
      array = ary
    end

    return check_symbol(acc, init, symbol, array) if init.is_a?(Symbol) || symbol.is_a?(Symbol)

    array.my_each do |item|
      acc = yield(acc, item)
    end
    acc
  end

  def my_none?
    array = is_a?(Range) ? to_a : self
    flag = true

    array.my_each do |item|
      return false if yield(item)
    end
    flag
  end

  def my_map(prok = nil)
    return enum_for unless block_given?

    array = is_a?(Range) ? to_a : self

    filtered = []
    if prok
      array.my_each { |item| filtered.push(prok.call(item)) }
    else
      array.my_each { |item| filtered.push(yield(item)) }
    end
    filtered
  end

  def my_select
    return enum_for unless block_given?

    array = is_a?(Range) ? to_a : self
    filtered = []
    array.my_each { |item| filtered.push(item) if yield(item) }
    filtered
  end
end

class Array
  def my_each(&block)
    return enum_for unless block_given?

    array = is_a?(Range) ? to_a : self

    array.map(&block)
    self
  end
end

