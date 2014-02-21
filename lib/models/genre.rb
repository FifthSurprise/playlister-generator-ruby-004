class Genre
  attr_accessor :name, :songs, :artists
  ALL = []

  def initialize
    ALL.push(self)
    self.songs =[]
    self.artists= []
  end

  def self.all
    ALL
  end

  def self.count
    ALL.count
  end

  def self.reset_all
    ALL.clear
  end

  def self.find_by_name (name)
    ALL.select{|genre|genre.name == name}.first
  end

  def self.create_by_name (name)
    Genre.new.name=name if (find_by_name(name).nil?)
    find_by_name(name)
  end

  def url
    (name.downcase.gsub(" ","_")+".html").gsub("'","")
  end
end
