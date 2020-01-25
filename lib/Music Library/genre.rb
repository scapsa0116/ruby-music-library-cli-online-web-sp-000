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
  
   def self.create(name)
  genre =Genre.new(name)
  self.all << genre 
  genre
end 
  
  def self.destroy_all
    @@all.clear
  end 
  
 
 
 def artists
    self.songs.collect{|song| song.artist}.uniq
  end
  
  def to_s 
    self.name 
  end 
end 