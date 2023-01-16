module Enumerable
  # Your code goes here
  def my_all?
    self.my_each do |arr|
      return false unless yield arr
    end
    true
  end

  def my_any?
    self.my_each do |arr|
      return true if yield arr
    end
    false
  end

  def my_none?
    self.my_each do |arr|
      return false if yield arr
    end
    true
  end

  def my_count
    if block_given?
      count = 0
      self.my_each do |arr|
        count = count + 1 if yield arr
      end
      count
    else
      self.length
    end
  end

  def my_each_with_index
    index = 0
    self.my_each do |value|
      yield value, index
      index += 1
    end
  end
  
  def my_map
    arr = []
    self.my_each do |value|
      arr.push(yield value)
    end
    arr
  end

  def my_select
    result = []
    self.my_each do |value|
      result.push(value) if yield value
    end
    result
  end

  def my_inject(initial_value)
    self.my_each do |value|
      initial_value = yield(initial_value, value)
    end
    initial_value
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for i in self
      yield i
    end
  end
end 
