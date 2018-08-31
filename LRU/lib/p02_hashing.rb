require 'json'
class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  
  def hash
    val = self[0].object_id
    (1...self.length).each do |el|
      val ^= (self[el].object_id * el)
      
    end 
    val.hash 
  end
  
end

class String
  def hash
    val = self[0].ord
    (1...self.length).each do |el|
      val ^= (self[el].ord * el)
    end 
    val.hash  
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.to_json.hash
  end
  
end
