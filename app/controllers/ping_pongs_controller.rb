class PingPongsController < ApplicationController
  # GET /ping_pongs
  # GET /ping_pongs.xml
  def index
    @ping_pongs = PingPong.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ping_pongs }
    end
  end

  # GET /ping_pongs/1
  # GET /ping_pongs/1.xml
  def show
    @ping_pong = PingPong.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ping_pong }
    end
  end

  # GET /ping_pongs/new
  # GET /ping_pongs/new.xml
  def new
    @ping_pong = PingPong.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ping_pong }
    end
  end

  # GET /ping_pongs/1/edit
  def edit
    @ping_pong = PingPong.find(params[:id])
  end

  # POST /ping_pongs
  # POST /ping_pongs.xml
  def create
    @ping_pong = PingPong.new(params[:ping_pong])
    
    @blacklist = [params[:blacklist].split(","), @ping_pong.ping, @ping_pong.pong].flatten.uniq
  
    # Find the next ping
    wordnik #initialize the api
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
    
    # Added a default word just in case
    @related_words << "juicy" if @related_words.empty?
    
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

  # PUT /ping_pongs/1
  # PUT /ping_pongs/1.xml
  def update
    @ping_pong = PingPong.find(params[:id])

    respond_to do |format|
      if @ping_pong.update_attributes(params[:ping_pong])
        format.html { redirect_to(@ping_pong, :notice => 'Ping pong was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ping_pong.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ping_pongs/1
  # DELETE /ping_pongs/1.xml
  def destroy
    @ping_pong = PingPong.find(params[:id])
    @ping_pong.destroy

    respond_to do |format|
      format.html { redirect_to(ping_pongs_url) }
      format.xml  { head :ok }
    end
  end
end
