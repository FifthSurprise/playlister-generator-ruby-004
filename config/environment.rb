require 'bundler/setup'
Bundler.require
require 'erb'

require_relative '../lib/models/artist'
require_relative '../lib/models/genre'
require_relative '../lib/models/song'
require_relative '../lib/models/library_parser'
require_relative '../lib/models/playlister'
require_relative '../lib/site_generator'

# binding.pry