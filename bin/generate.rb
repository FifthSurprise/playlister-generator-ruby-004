#!/usr/bin/env ruby

require_relative '..config/environment'

parser = LibraryParser.new(PATH)
parser.parse


generator = SiteGenerator.new

generator.make_artist_index!
generator.make_genre_index!

generator.make_Artist_Pages
generator.make_Genre_Pages