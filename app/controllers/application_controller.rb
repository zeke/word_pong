class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def wordnik
    Wordnik::Wordnik.new(:api_key=>configatron.api.key)
  end
  
  # def blacklist_word(word)
  #   cookies[:blacklist] ||= ""
  #   cookies[:blacklist] = (cookies[:blacklist].split(",") + [word]).uniq
  # end
  # 
  # def blacklisted?(word)
  #   cookies[:blacklist].present? && cookies[:blacklist].split(",").include?(word)
  # end
  
end
