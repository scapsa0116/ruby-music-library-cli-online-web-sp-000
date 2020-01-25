# class MusicImporter
#   attr_accessor :path 
# def  initialize(path)
#   @path = path 
# end 

# def files
#     files = []
#     Dir.glob("#{path}/*.mp3").collect do |file|
#       files << file.gsub("#{path}/", "")
#     end
#     files
#   end


# def import
#     files.each{|file| Song.new_by_}
#   end
# end 


class MusicImporter
  attr_accessor :path, :files

  def initialize(path)
    @path = path
  end

  def files
      @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
  end

  def import
    files.each {|file| Song.create_from_filename(file) }
  end


end