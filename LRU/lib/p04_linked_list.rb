require 'byebug'
class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    @next.prev, @prev.next = @prev, @next
    self
  end
  
  def inspect
    "p=#{@prev} n=#{@next.to_s}"
  end 
  
end

class LinkedList
  include Enumerable
  
  def initialize
    @head = Node.new('HEAD')
    @tail = Node.new('TAIL')
    @head.next = @tail 
    @tail.prev = @head 
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end
  
  def each(&prc)
    root = @head.next 
    until root == @tail
      prc.call(root)
      root = root.next
    end 
    self
  end 

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    each {|node| return node.val if node.key == key} 
    nil
  end

  def include?(key)
    each {|node| return true if node.key == key} 
    false
  end

  def append(key, val)
    new_node = Node.new(key, val)
    new_node.next = @tail
    new_node.prev = @tail.prev
    @tail.prev = new_node
    new_node.prev.next = new_node
  end
  
  def add(key, val)
    unless update(key, val)
      append(key, val)
    end 
  end 

  def update(key, val)
    each {|node| node.val = val if node.key == key}
    nil
  end

  def remove(key)
    each { |node| return node.remove if node.key == key}
    nil
  end


  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
  
end
