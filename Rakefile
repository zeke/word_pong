# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rake'

WordPong::Application.load_tasks

desc 'Assign serves'
task :assign_serves => :environment do  
  ping_pongs = PingPong.order('id ASC')
  last_serve = nil
  ping_pongs.each do |ping_pong|
    if ping_pong.precedent_id.blank?
      last_serve = ping_pong
      next
    end
    ping_pong.update_attribute(:serve_id, last_serve.id)
  end
end