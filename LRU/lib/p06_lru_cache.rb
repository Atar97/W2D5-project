require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
  end

  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

  private
  #add things to my cache
  
  # def add!(key)
  #   if @map.include?(key)
  #     @map[key].remove
  #     @store.append(key, @map[key])
  #   elsif @store.count == @max - 1
  #     @store.first.remove
  #     @store.append(key, @map[key])
  #   else 
  #     @store.append(key, )
  # 
  # end

  def update_node!(node)
    # suggested helper method; move a node to the end of the list
  end

  def eject!
  end
end
