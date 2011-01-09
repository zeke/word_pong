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

    respond_to do |format|
      if @ping_pong.save
        format.html { redirect_to(@ping_pong, :notice => 'Ping pong was successfully created.') }
        format.xml  { render :xml => @ping_pong, :status => :created, :location => @ping_pong }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ping_pong.errors, :status => :unprocessable_entity }
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
