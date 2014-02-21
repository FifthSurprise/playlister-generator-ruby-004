#!/usr/bin/env ruby

require_relative '..config/environment'


Artist.make_artist_index!
Genre.make_genre_index!


Artist.make_Artist_Pages
Genre.make_Genre_Pages