# class Song 
#   extend Concerns::Findable
# attr_accessor :song, :name, :artist, :genre   
#   # attr_reader :artist, :genre 
#   @@all = []
  
#   def initialize(name,artist =nil,genre = nil) 
#     @name = name 
#     self.artist = artist if artist
#     self.genre = genre if genre  
#     save 
#   end 
  
#   def self.all 
#     @@all 
#   end 
  
#   def save 
#     @@all << self 
#   end 

# def self.create(name)
#   song = Song.new(name)
#   self.all << song 
#   song 
# end 
  
#   def artist= (artist)
#     @artist = artist 
#     artist.add_song(self)
#   end
  
#   def genre= (genre)
#     @genre = genre 
#     genre.add_song(self)
#   end 
  
  
#   def self.destroy_all
#     @@all.clear
#   end 
  
# # def find_or_create_by_name(name)
# #   if self.find_by_name(name) == nil 
# #   self.create(name)
# # else 
# #   self.find_by_name(name)
# #   end 
# # end 

# def self.new_from_filename(file_name)
#   array = file_name.split("-")
#   artist_name = array[0]
#   artist = Artist.find_or_create_by_name(artist_name)
#   title = array[1]
#   genre_name = (array[2].chomp(".mp3"))
#   genre = Genre.finf_or_create_by_name(genre_name)
#   new_song = Song.new(title, artist, genre)
# end 
  
  
  
# end 



class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=artist if artist
    # self.artist.songs.push(self)
    self.genre=genre if genre
    # @artist = artist
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
    song = self.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
    # Artist.all.push(artist)
  end

  def genre=(genre)
    @genre = genre
    if !(genre.songs.include?(self))
      genre.songs << self
      # Genre.all.push(genre)
    # binding.pry
    end
  end

  def self.find_by_name(name)
    all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    # if self.find_by_name(name)
    #   self.find_by_name(name)
    # else
    # song = self.create(name)
    # end
    find_by_name(name) || create(name)
  end

  def self.new_from_filename(filename)
    info = filename.split(" - ")
    artist, name, genre = info[0], info[1], info[2].gsub( ".mp3" , "")

    # song = self.find_or_create_by_name(name)
    genre = Genre.find_or_create_by_name(genre)
    artist = Artist.find_or_create_by_name(artist)

    new(name,artist,genre)
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).tap{ |s| s.save}

  end
end
