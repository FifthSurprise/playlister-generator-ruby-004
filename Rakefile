task :environment do
  require_relative './config/environment'
  puts "Environment loaded"
end

task :console => [:environment] do
  Pry.start  
end