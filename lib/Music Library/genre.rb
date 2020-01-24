class Genre 
  extend Concerns::Findable
  attr_accessor :name, :songs, :artist 
  
 @@all = []
 
 def initialize(name)
   @name = name 
   @songs = []
   save 
   
 end 
 
 def self.all 
    @@all 
  end 
  
  def save 
    @@all << self 
  end 
  
  def destry_all
    @@all.clear
  end 
  
 
 
 def artists
    songs.collect{|song| song.artist}.uniq
  end
end 