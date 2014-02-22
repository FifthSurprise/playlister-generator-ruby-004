require 'spec_helper'

describe 'SiteGenerator' do
  let(:site_generator) { SiteGenerator.new }

  before do
    Artist.reset_all
    Genre.reset_all
    Song.reset_all
    lp = LibraryParser.new(DATA_PATH)
    lp.parse
  end

  after do
    File.open('_site/genres.html', 'w') do |f|
      f.write('')
      f.close
    end
    File.open('_site/artists.html', 'w') do |f|
      f.write('')
      f.close
    end
  end

  describe '#make_artist_index!' do
    it 'creates artists.html in the _site directory' do
      site_generator.make_artist_index!
      comparison = File.read('spec/fixtures/artists.html')
      index = File.read('_site/artists.html')
      expect(index).to eq(comparison)
    end
  end

  describe '#make_genre_index!' do
    it 'creates genres.html in the _site directory' do
      site_generator.make_genre_index!
      comparison = File.read('spec/fixtures/genres.html')
      index = File.read('_site/genres.html')
      expect(index).to eq(comparison)
    end
  end

  describe '#generate_pages!' do
    after do
      FileUtils.rm(Dir.glob('_site/genre/*.html'))
      FileUtils.rm(Dir.glob('_site/artist/*.html'))
      FileUtils.rm(Dir.glob('_site/song/*.html'))
    end

    it 'creates an html page for each genre in the _site/genre directory' do
      site_generator.generate_Genre_Pages
      expect(Dir.entries('_site/genre').reject{|e| e.start_with?('.')}.size).to eq(10)
    end
    it 'creates an html page for each song in the _site/song directory' do
      site_generator.generate_Song_Pages
      expect(Dir.entries('_site/song').reject{|e| e.start_with?('.')}.size).to eq(99)
    end
    it 'creates an html page for each artist in the _site/artist directory' do
      site_generator.generate_Artist_Pages
      expect(Dir.entries('_site/artist').reject{|e| e.start_with?('.')}.size).to eq(90)
    end
  end
end
