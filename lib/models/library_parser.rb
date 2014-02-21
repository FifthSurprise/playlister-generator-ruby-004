class LibraryParser
  attr_accessor :path
  def initialize (path)
    self.path = path
  end

  def files
    #Look into the directory and get all files. However, make sure that "." and ".."
    #are not included
    Dir.entries(@path).select {|file|file!="."&&file!=".."}
  end

  def parse
    files.each do |string|
      songComponents = parse_filename(string)
      build_song(songComponents[0],songComponents[1],songComponents[2])
    end
  end

  def parse_filename (path)
    #get the Song Name [\S+|\s]+(?= -)
    #get the Artist (?<=- )[\S+|\s]+(?= \[)
    #get the tag (?<=\[)\S+(?=\])
    [path.scan(%r[[\S+|\s]+(?= -)]).first,
     path.scan(%r[(?<=- )[\S+|\s]+(?= \[)]).first,
            path.scan(%r[(?<=\[)\S+(?=\])]).first]
    #These regex patterns are a little restrict, could probably refactor in case someone
    #messes up the spaces, etc.
    #I use ?<= and ?= to exclude characters.  So ?<=\[ will check for [ but exclude it
    #from the match
  end

  def build_song (artist,song,genre)
    newArtist = Artist.create_by_name(artist)
    newSong = Song.create_by_name(song)
    newSong.artist = newArtist
    newSong.genre= (Genre.create_by_name(genre))
    newArtist.add_song(newSong)
    newSong
  end
end
