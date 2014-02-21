# require '../config/environment'
class SiteGenerator
  def initialize
  end
  def make_artist_index!

  end

  def make_genre_index!
    
  end

  def generate_Artist_Pages
    #call each Artist to create its own page
    template_doc = File.open("lib/templates/artist.html.erb")
    template = ERB.new(template_doc.read)
    Artist.all.each do |artist|
      File.write("_site/artist/#{artist.name}", template.result(binding))
    end
  end

  #call each Genre to create its own page
  def generate_Genre_Pages
    template_doc = File.open("lib/templates/genre.html.erb")
    template = ERB.new(template_doc.read)
    Genre.all.each do |genre|
      File.write("_site/genre/#{genre.url}", template.result(binding))
    end
  end

  #call each Song to create its own page
  def generate_Song_Pages
  end
end
