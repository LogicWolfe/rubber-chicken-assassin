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
    @kill.victim_id = "511852582"

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
    @kill = Kill.new(params[:kill])

    @access_token = params[:access_token]
    
    @assassin = get_facebook_data(@kill.killer_id, nil, @access_token)
    @victim = get_facebook_data(@kill.victim_id, nil, @access_token)
    @friends = get_facebook_data(@kill.victim_id, 'friends', @access_token)

    @body = get_facebook_data(@kill.victim_id, 'movies', @access_token)
    if (@favorite_movie != nil)
      @favorite_movie = @body["data"][0]["name]"]  
    end    

    @body = get_facebook_data(@kill.victim_id, 'music', @access_token)
    if (@favorite_band != nil)
      @favorite_band = @body["data"][0]["name]"]  
    end
    
    @body = get_facebook_data(@kill.victim_id, 'books', @access_token)
    if (@favorite_book != nil)
      @favorite_book = @body["data"][0]["name]"]  
    end

    @body = get_facebook_data(@kill.victim_id, 'feed', @access_token)
    for i in 0..@body["data"].length
      if ((@body["data"][i]["to"] == nil) && (@body["data"][i]["message"] != nil) && (@body["data"][i]["from"]["name"] == (@victim["first_name"] + " " + @victim["last_name"])))
        @last_status_update = @body["data"][i]["message"]
        break
      end
    end

    @kill.create_obituary(
      :first_name => @victim["first_name"],
      :last_name => @victim["last_name"],
      :assassin_full_name => @assassin['name'],
      :assassin_photo => RestClient.get("https://graph.facebook.com/#{@kill.killer_id}/picture", :params => {
        :type => :large,
        :access_token => @access_token
      }).body,
      :gender => @victim["gender"],
      :fb_friends_count => @friends["data"].length,
      :favorite_movie => @favorite_movie,
      :favorite_band => @favorite_band,
      :favorite_book => @favorite_book,
      :last_status_update => @last_status_update,
      :location => "LOCATION"
    )

    if @kill.save
      render :text => obituary_path(@kill.obituary)
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
