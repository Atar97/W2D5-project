require_relative 'p01_int_set'


class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    unless self[key].include?(key)
      @count += 1 
      if @count == num_buckets
        resize! 
      end 
      self[key] << key
    end 
  end

  def include?(key)
    self[key].include?(key)
    
  end

  def remove(key)
    @count -= 1 if self[key].delete(key)
  end

  private

  def [](num)
    @store[num.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    temp = Array.new(num_buckets * 2) { Array.new }
    @store.each do |bucket|
      bucket.each do |el|
        temp[el % temp.length] << el
      end 
    end 
    @store = temp
  end
end
