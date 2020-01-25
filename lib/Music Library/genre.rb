# class Genre 
#   extend Concerns::Findable 
#   attr_accessor :name, :songs, :artist 
  
# @@all = []
 
# def initialize(name)
#   @name = name 
#   @songs = []
#   save 
   
# end 
 
# def self.all 
#     @@all 
#   end 
  
#   def save 
#     @@all << self 
#   end 
  
#   def self.create(name)
#   genre =Genre.new(name)
#   self.all << genre 
#   genre
# end 
  
#   def self.destroy_all
#     @@all.clear
#   end 
  
 
 
# def artists
#     self.songs.collect{|song| song.artist}.uniq
#   end
  
#   def to_s 
#     self.name 
#   end 
# end 


class Genre
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end

  def songs
    @songs
  end

  def artists
    self.songs.collect {|s| s.artist}.uniq
  end
end