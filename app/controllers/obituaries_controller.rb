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

  # TODO: Refactor out all the RestClient get calls and change it so that you can pass in a param for the type of call
  #       Returns a JSON hash
  # TODO: Randomize the [0] from [0..MAX_ITEMS_OF_TYPE] so that you don't get the same item every time, unless you want it
  #       [0] is usually the latest "created_time"
  # TODO: Get Assassin's full name
  # TODO: Get location from DB
  # TODO: Fill in Access token and victim name from DB
  def show
    require 'rest_client'

    # Put access token retrieved from iPhone here
    @access_token = '2227470867|2.VSynNLl0v2y0BkH6RLJ9kg__.3600.1297584000-120406278|n6FmTgOiHq4oooopIYav_ZWmO8s'

    # Put victim's Facebook ID or vanity name here
    @victim = 'tonytones'

    response = RestClient.get 'https://graph.facebook.com/' + @victim, :params => { :access_token => @access_token }
    @body = JSON.parse(response.body)
    @first_name = @body["first_name"]
    @last_name = @body["last_name"]
    @full_date = Time.new.strftime("%B %d, %Y")
    if (@body["gender"] == "male")
      @he_she = "he";
      @his_her = "his";
    else
      @he_she = "she";
      @his_her = "her";
    end
    response = RestClient.get 'https://graph.facebook.com/' + @victim + '/friends', :params => { :access_token => @access_token }
    @body = JSON.parse(response.body)
    @fb_friends_count = @body["data"].length
    response = RestClient.get 'https://graph.facebook.com/' + @victim + '/movies', :params => { :access_token => @access_token }
    @body = JSON.parse(response.body)
    @favorite_movie = @body["data"][0]["name"]
    response = RestClient.get 'https://graph.facebook.com/' + @victim + '/music', :params => { :access_token => @access_token }
    @body = JSON.parse(response.body)
    @favorite_band = @body["data"][0]["name"]
    response = RestClient.get 'https://graph.facebook.com/' + @victim + '/feed', :params => { :access_token => @access_token }
    @body = JSON.parse(response.body)
    @last_status_update = @body["data"][0]["message"]
    @location = "LOCATION"
    @assassin_full_name = "ASSASSIN_FULL_NAME"
    @assassin_photo_url = "https://graph.facebook.com/" + @victim + "/picture?type=large&access_token=" + @access_token

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
