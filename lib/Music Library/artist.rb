# class Artist 
#   extend Concerns::Findable 
#   attr_accessor :name, :songs, :genre
#   @@all = []
  
#   def initialize(name) 
#     songs = []
#     @name = name 
#     save 
#   end 
  
#   def self.songs 
#     @songs 
#   end 
  
#   def self.all 
#     @@all 
#   end 
  
#   def save 
#     @@all << self 
#   end 
  
#   def self.create(name)
#   artist = Artist.new(name)
#   self.all << artist 
#   artist 
# end 
  
#   def self.destroy_all
#     @@all.clear
#   end 
  
  
#   def genres
#     self.songs.collect {|song| song.genre}.uniq
#   end 
    
  
# end 