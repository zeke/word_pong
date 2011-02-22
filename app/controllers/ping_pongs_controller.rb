class PingPongsController < ApplicationController

  def index
    @ping_pongs = PingPong.all
    respond_to do |format|
      format.html
      format.xml { render :xml => @ping_pongs }
      format.json { render :json => @ping_pongs }
    end
  end

  def create
    @ping_pong = PingPong.new(params[:ping_pong])

    wordnik # initialize the api
    @related_words = [] # container for possible pings (first will be used)

    # Add the latest ping to the blacklist
    @blacklist = params[:blacklist].split(",")
    @blacklist << @ping_pong.ping

    # If user passed in a blank pong, don't bother adding it to the blacklist
    # or looking for a good ping response.
    if @ping_pong.pong.present?

      # Add the latest pong to the blacklist
      @blacklist << @ping_pong.pong

      # Find the next ping (rescue in case the pong string busts the API call)
      begin
        pong = Wordnik::Word.find(@ping_pong.pong)
        relatives = pong.related(:type => configatron.desirable_relation_types.join(','))

        # favor antonyms, but fall back to synonyms
        configatron.desirable_relation_types.each do |type|
          next if relatives[type].nil?
          relatives[type].each do |relative|
            break unless @related_words.empty?
            @related_words << relative.wordstring unless @blacklist.include?(relative.wordstring)
          end
        end
      rescue
        Rails.logger.debug "BAD PONG: #{@ping_pong.pong}"
      end

    end

    # Add a random word if we don't have a ping candidate yet
    @related_words << wordnik.random_word.wordstring if @related_words.empty?

    @blacklist = @blacklist.flatten.uniq.join(',')

    respond_to do |format|
      if @ping_pong.save
        format.js {render :content_type => 'text/javascript'}
      else
        format.html { render :action => "new" }
      end
    end
  end

end
