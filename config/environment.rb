require 'bundler'
Bundler.require

module Concerns
#   module Findable 
  
  
#   def find_by_name(name)
#     all.map do |song|
#       if song.name == name 
#         return song 
#       end 
#     end 
# end 
# end 


# def find_or_create_by_name(name)
#   if self.find_by_name(name) == nil 
#   self.create(name)
#   else 
#   self.find_by_name(name)
#   end 
# end

module Findable
  def find_by_name(name)
    self.all.detect {|song| song.name == name}
  end
end 

  def find_or_create_by_name(name)
    # if self.find_by_name(name)
    #   self.find_by_name(name)
    # else
    # song = self.create(name)
    # end

    self.find_by_name(name) || self.create(name)

# def find_or_create_by_name(name)
#   if self.find_by_name(name) == nil 
#   self.create(name)
#   else 
#   self.find_by_name(name)
#   end 

 end
end 

require_all 'lib'
