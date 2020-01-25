module Concerns
  module Findable
  
  
  def find_by_name(name)
  all.map do |song|
    if song.name == name 
      return song 
    end 
  end 
end 

def find_or_create_by_name(name)
  if self.find_by_name(name) == nil 
  self.create(name)
  else 
  self.find_by_name(name)
  end 
 end 
end 
end 