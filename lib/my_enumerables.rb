module Enumerable
  # Your code goes here
  def my_each_with_index
    index = 0

    my_each do |item|
      yield(item, index)
      index += 1
    end
  end

  def my_select
    filtered_list = []
    my_each do |item|
      filtered_list << item if yield(item)
    end
    filtered_list
  end

  def my_all?
    my_each do |item|
      return false unless yield(item)
    end
    true
  end

  def my_any?
    my_each do |item|
      return true if yield(item)
    end
    false
  end

  def my_none?
    my_each do |item|
      return false if yield(item)
    end
    true
  end

  def my_count
    if block_given?
      count = 0
      my_each do |item|
        count += 1 if yield(item)
      end
      count
    else
      length
    end
  end

  def my_map
    new_array = []
    my_each do |item|
      new_array << yield(item)
    end
    new_array
  end

  def my_inject(accumulator = 0)
    my_each do |item|
      accumulator = yield(accumulator, item)
    end
    accumulator
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for item in self
      yield item
    end
  end
end
