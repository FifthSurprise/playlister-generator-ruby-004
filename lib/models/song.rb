class Song
  attr_accessor :name, :artist, :genre
  ALL =[]
  def initialize
    ALL.push(self)
  end

  def genre= (genre)
    @genre = genre
    @genre.songs.push(self)
  end

  def self.all
    ALL
  end

  def self.reset_all
    ALL.clear
  end

  def self.find_by_name (name)
    ALL.select{|song|song.name.downcase == name.downcase}.first
  end

  def self.create_by_name(name)
    Song.new.name=name
    find_by_name(name)
  end

  def self.count
    ALL.count
  end

  def to_s
    "#{self.artist.name} - #{self.name} [#{self.genre.name}]"
  end
end
