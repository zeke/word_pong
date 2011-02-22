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