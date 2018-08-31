require_relative 'p04_linked_list'
require 'byebug'
class HashMap 
  attr_reader :count, :store
  
  include Enumerable

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    bucket(key).include?(key)
  end
  
  def set(key, val)
    if bucket(key).include?(key)
      bucket(key).update(key, val)
    else 
      @count += 1
      resize! if count == num_buckets
      bucket(key).append(key, val)
    end   
  end
  
  def get(key)
    bucket(key).get(key)
  end
  
  def delete(key)
    @count -= 1 if bucket(key).remove(key)
  end
  
  def each(&prc)
    ret = []
    @store.each do |list|
      list.each {|node| ret << prc.call(node.key, node.val)}
    end 
    ret
  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    temp = Array.new(num_buckets * 2) { LinkedList.new }
    
    @store.each do |linklist|
      linklist.each  do |link|
        temp[link.key.hash % temp.length].append(link.key, link.val)
      end 
    end 
    
    @store = temp
  end

  def bucket(key)
    @store[key.hash % num_buckets]
  end
end
