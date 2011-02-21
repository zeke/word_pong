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
    
    # TODO: Store the blacklist in a cookie (maybe ezcookie supports arrays?), not a param.
    @blacklist = [params[:blacklist].split(","), @ping_pong.ping, @ping_pong.pong].flatten.uniq
  
    # Find the next ping
    wordnik # initialize the api
    pong = Wordnik::Word.find(@ping_pong.pong)
    
    
    relatives = pong.related(:type => configatron.desirable_relation_types.join(','))
    
    # favor antonyms, but fall back to synonyms
    @related_words = []
    configatron.desirable_relation_types.each do |type|
      next if relatives[type].nil?
      relatives[type].each do |relative|
        break unless @related_words.empty?
        @related_words << relative.wordstring unless @blacklist.include?(relative.wordstring)
      end
    end
    
    # Add a random word just in case
    @related_words << wordnik.random_word.wordstring if @related_words.empty?
    
    @blacklist = @blacklist.join(',')
    
    respond_to do |format|
      if @ping_pong.save
        # format.html { redirect_to(@ping_pong, :notice => 'Ping pong was successfully created.') }
        format.js {render :content_type => 'text/javascript'}
      else
        format.html { render :action => "new" }
      end
    end
  end

end
