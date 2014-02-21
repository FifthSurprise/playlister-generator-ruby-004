class Artist
  ALL = []
  attr_accessor :name, :songs, :genres
  def initialize
    ALL.push self
    self.songs=[]
    self.genres=[]
  end
  
  def url
     name.downcase.split(' ').join('_').concat(".html")
  end

  def url
    "#{self.name.downcase.tr(" ", "_").tr("$&.-", "")}.html"
  end

  def add_song (song)
    #when adding a song, the song should be added to the corresponding genre's song list.
    song.artist = self
    @songs.push (song)

    #ensure that the song has a listed genre
    if song.genre
      #The genre should be added to the Artist's genre list
      @genres.push (song.genre)
      #The Artist should be added to the Genre's artist list if it's not there already
      song.genre.artists.push(self) unless song.genre.artists.include?(self)
    end
  end

  def add_songs (songs)
    songs.each {|song| self.add_song(song)}
  end

  def self.all
    ALL
  end

  def self.count
    ALL.length
  end

  def self.reset_all
    ALL.clear
  end

  def self.find_by_name(name)
    ALL.select{|artist|artist.name.downcase == name.downcase}.first
  end

  def self.create_by_name(name)
    Artist.new.name=name if find_by_name(name).nil?
    find_by_name(name)
  end
end
