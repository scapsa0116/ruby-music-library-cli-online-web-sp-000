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



class Artist
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    # self.save
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
    artist = self.new(name)
    artist.save
    artist
  end

  def songs
    @songs
  end

  def add_song(song)

      song.artist = self unless song.artist
      songs << song unless songs.include?(song)
      # @songs.uniq!

  end

  def genres
    # self.songs.collect {|song| song.genre}
    songs.collect { |song| song.genre}.uniq
  end
end

