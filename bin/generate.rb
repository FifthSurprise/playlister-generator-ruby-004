#!/usr/bin/env ruby

require_relative '../config/environment'

parser = LibraryParser.new(DATA_PATH)
parser.parse


generator = SiteGenerator.new

generator.make_artist_index!
generator.make_genre_index!

generator.generate_Artist_Pages
generator.generate_Genre_Pages