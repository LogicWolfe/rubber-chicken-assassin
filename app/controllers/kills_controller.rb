class KillsController < ApplicationController
  protect_from_forgery :except => :create

  # GET /kills
  # GET /kills.xml
  def index
    @kills = Kill.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @kills }
    end
  end

  # GET /kills/1
  # GET /kills/1.xml
  def show
    @kill = Kill.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @kill }
    end
  end

  # GET /kills/new
  # GET /kills/new.xml
  def new
    @kill = Kill.new

    @kill.killer_id = "583002418"
    @kill.victim_id = "867800458"

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @kill }
    end
  end

  # GET /kills/1/edit
  def edit
    @kill = Kill.find(params[:id])
  end

  # POST /kills
  # POST /kills.xml
  def create
    if params[:kill]
      @kill = Kill.new(params[:kill])
    else
      @kill = Kill.new(
        :killer_id => params[:killer_id], 
        :victim_id => params[:victim_id], 
        :location => params[:location], 
        :attack_sequence => params[:attack_sequence], 
        :photo => params[:photo]
      )
    end

    logger.info 1
    @access_token = params[:access_token]
logger.info 2
    
    @assassin = get_facebook_data(@kill.killer_id, nil, @access_token)
    @victim = get_facebook_data(@kill.victim_id, nil, @access_token)
logger.info 3
    
    begin
      @friends = get_facebook_data(@kill.victim_id, 'friends', @access_token)
      @fb_friends_count = @friends["data"].length
    rescue
      @fb_friends_count = nil
    end
logger.info 4
    
    @body = get_facebook_data(@kill.victim_id, 'movies', @access_token)
    if (@body["data"][0] == nil)
      @favorite_movie = nil
    else
      @favorite_movie = @body["data"][0]["name"]
    end
logger.info 5
    
    @body = get_facebook_data(@kill.victim_id, 'music', @access_token)
    if (@body["data"][0] == nil)
      @favorite_band = nil
    else
      @favorite_band = @body["data"][0]["name"]
    end
logger.info 6
    
    @body = get_facebook_data(@kill.victim_id, 'books', @access_token)
    if (@body["data"][0] == nil)
      @favorite_book = nil
    else
      @favorite_book = @body["data"][0]["name"]
    end
logger.info 7
    
    @body = get_facebook_data(@kill.victim_id, 'events', @access_token)
    if (@body["data"][0] == nil)
      @recent_event = nil
    else
      @recent_event = @body["data"][0]["name"]
    end
logger.info 8
    
    @body = get_facebook_data(@kill.victim_id, 'feed', @access_token)
    if @body
      for i in 0...@body["data"].length
        if ((@body["data"][i]["to"] == nil) && (@body["data"][i]["message"] != nil) && (@body["data"][i]["from"]["name"] == (@victim["first_name"] + " " + @victim["last_name"])))
          @last_status_update = @body["data"][i]["message"]
          break
        end
      end
    else
      @last_status_update = nil
    end
logger.info 9
    
    # Location
    begin
      @locations_list = get_locations(@kill.location, @access_token)
    rescue
      @locations_list = nil
    end
    
    if (@locations_list && @locations_list["data"].length == 0)
      @location = @locations_list["data"][0]["name"]
    else
      @location = "the scene of the crime"
    end
logger.info 10
    
    @assassin_photo = RestClient.get("https://graph.facebook.com/#{@kill.killer_id}/picture", :params => {
      :type => :large,
      :access_token => @access_token
    }).body
logger.info 11
    
    @kill.create_obituary(
      :first_name => @victim["first_name"],
      :last_name => @victim["last_name"],
      :assassin_full_name => @assassin["name"],
      :assassin_photo => @assassin_photo,
      :gender => @victim["gender"],
      :fb_friends_count => @fb_friends_count,
      :favorite_movie => @favorite_movie,
      :favorite_band => @favorite_band,
      :favorite_book => @favorite_book,
      :recent_event => @recent_event,
      :last_status_update => @last_status_update,
      :location => @location
    )
    logger.info 12
    
    if @kill.save
      render :text => obituary_url(@kill.obituary)
    else
      render :text => @kill.errors.inspect
    end
  end

  # PUT /kills/1
  # PUT /kills/1.xml
  def update
    @kill = Kill.find(params[:id])

    respond_to do |format|
      if @kill.update_attributes(params[:kill])
        format.html { redirect_to(@kill, :notice => 'Kill was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @kill.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /kills/1
  # DELETE /kills/1.xml
  def destroy
    @kill = Kill.find(params[:id])
    @kill.destroy

    respond_to do |format|
      format.html { redirect_to(kills_url) }
      format.xml  { head :ok }
    end
  end
end
