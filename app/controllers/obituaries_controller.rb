class ObituariesController < ApplicationController
  INTRO = [
    "Embracing our spirituality we celebrate the life of <%=@first_name%> <%=@last_name%> on <%=@full_date%>.",
    "Together we mourn the loss of <%=@first_name%> <%=@last_name%> on <%=@full_date%>.",
    "With moderate regret we inform you of the loss of <%=@first_name%> <%=@last_name%> on <%=@full_date%>.",
    "With marginal regret we announce the loss of <%=@first_name%> <%=@last_name%> on <%=@full_date%>.",
    "With not as much sadness as we expected we announce the passing of <%=@first_name%> <%=@last_name%> on <%=@full_date%>.",
    "We most insincerely announce the departure of <%=@first_name%> <%=@last_name%> on <%=@full_date%>.",
    "We most sincerely announce the departure of <%=@first_name%> <%=@last_name%> on <%=@full_date%>.",
    "With deepest regrets we inform you about the loss of <%=@first_name%> <%=@last_name%> on <%=@full_date%>.",
    "We regret to announce the sudden passing of <%=@first_name%> <%=@last_name%> on <%=@full_date%>."
  ]

  DEATH_DESC = [
    "<%=@first_name%> died as a result of a humorous yet persistent assault via rubber chicken.",
    "<%=@first_name%> died as a result of a humorous yet persistent assault via rubber chicken.",
    "<%=@first_name%> was ruthlessly bludgeoned to death with a rubber chicken wielded by an assassin."
  ]

  LEAVING_BEHIND = [
    "<%=@he_she%> leaves behind <%=@fb_friends_count%> friends"
  ]

  LEAVING_BEHIND2 = [
    "an extensive DVD collection featuring a rare collector's edition of <%=@favorite_movie%>."
  ]

  FINAL_WORDS = [
    "<%=@first_name%> asked to be remembered by <%=@his_her%> final words, \"<%=@last_status_update%>\"."
  ]

  RANDOM_FACTS = [
  ]

  INTRO_TO_ASSASSIN = [
    "Authorities are searching for the unknown assailant, last seen fleeing  with a rubber chicken."
  ]

  ASSASSIN_SECTION = [
    "The leading suspect was last seen fleeing <%=@location%> with a rubber chicken and has been identified as
     one <%=@assassin_full_name%>, a known rubber-chicken assassin with a reputed <%=@kill_count%>
     assassinations to his name.  Police have released the following photo: <div class=\"assassin_photo\"><img src='<%=@assassin_photo_url%>'/></div>"
  ]

  JOIN_ASSASSIN = [
    "Concerned family encourage all of <%=@first_name%>'s friends to join the bounty hunt at <a href='www.chickenassassin.com'>www.chickenassassin.com</a>"
  ]

  def index
  end

  def get_facebook_data(victim, type, access_token)
    if type == nil
      response = RestClient.get "https://graph.facebook.com/#{victim}", :params => { :access_token => access_token }
    else
      response = RestClient.get "https://graph.facebook.com/#{victim}/#{type}", :params => { :access_token => access_token }
    end
    return JSON.parse(response.body)
  end

  # TODO: Randomize the [0] from [0..MAX_ITEMS_OF_TYPE] so that you don't get the same item every time, unless you want it
  #       [0] is usually the latest "created_time"
  # TODO: Get Assassin's full name
  # TODO: Get location from DB
  # TODO: Fill in Access token and victim name from DB
  def show
    require 'rest_client'

    # Put access token retrieved from iPhone here
    @access_token = '2227470867|2.fG5_UFptDCqPVC9d_4o03g__.3600.1297627200-120406278|F9VhrETi1dHVKtb7UP3LT7I7jpE'

    # Put victim's Facebook ID or vanity name here
    @victim = 'tonytones'

    # Put assassin's name here
    @assassin = '120408363'

	#Time and Date
	@time = Time.new
    @full_date = @time.strftime("%B %d, %Y")
    @time_killed = @time.strftime("%I:%M %p")
	
	#Assassin Information
	@body = get_facebook_data(@assassin, nil, @access_token)
    @assassin_full_name = @body["name"]
    @assassin_photo_url = "https://graph.facebook.com/#{@assassin}/picture?type=large&access_token=#{@access_token}"
	
	#Victim Information
	@body = get_facebook_data(@victim, nil, @access_token)
    @first_name = @body["first_name"]
    @last_name = @body["last_name"]
    if (@body["gender"] == "male")
      @he_she = "he";
      @his_her = "his";
	elsif (@body["gender"] == "female")
	  @he_she = "she";
	  @his_her = "her";
    else #user did not specify gender. 
      @he_she = "it";
      @his_her = "its";
    end
    
    @victim_photo_url = "https://graph.facebook.com/#{@victim}/picture?type=large&access_token=#{@access_token}"

	@body = get_facebook_data(@victim, 'friends', @access_token)
    @fb_friends_count = @body["data"].length
    
	@body = get_facebook_data(@victim, 'movies', @access_token)
    @favorite_movie = @body["data"][0]["name"]
    
	@body = get_facebook_data(@victim, 'music', @access_token)
    @favorite_band = @body["data"][0]["name"]
    
	@body = get_facebook_data(@victim, 'feed', @access_token)
	for i in 0..@body["data"].length
		if ((@body["data"][i]["to"] == nil) && (@body["data"][i]["message"] != nil) && (@body["data"][i]["from"]["name"] == (@first_name + " " + @last_name)))
			@last_status_update = @body["data"][i]["message"]
			break
		end
	end

	#reverse geosyncing is inaccurate. 
	#This may not be usable unless we post coordinates
    @location = "LOCATION"
	

    @intro = INTRO.first
    @death_desc = DEATH_DESC.first
    @leaving_behind = LEAVING_BEHIND.first
    @leaving_behind2 = LEAVING_BEHIND2.first
    @final_words = FINAL_WORDS.first
    @intro_to_assassin = INTRO_TO_ASSASSIN.first
    @assassin_section = ASSASSIN_SECTION.first
    @join_assassin = JOIN_ASSASSIN.first
  end
end
