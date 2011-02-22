class PingPong < ActiveRecord::Base

  def serve?
    self.serve_id.blank?
  end

end
