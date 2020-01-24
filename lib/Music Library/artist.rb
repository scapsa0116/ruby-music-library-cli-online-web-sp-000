class Artist 
  extend Concerns::Findable 
  attr_accessor :name, :songs, :genre
  @@all = []
  
  def initialize 
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
  
  
  def genres
    self.songs.collect {|song| song.genre}.uniq
  end 
    
  
end 