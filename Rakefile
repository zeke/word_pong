# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rake'

WordPong::Application.load_tasks

task(:import_pronunciations => :environment) do
  File.open(Rails.root.join('cmudict.0.7a.txt')).readlines.each do |line|    
    p = Pronunciation.new
    p.word, p.transcription = line.split("  ")
    p.save!
    puts p.word
  end
end