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
    "<%=@first_name%> was whacked, figuratively and literally, by a rubber-chicken wielding assassin.",
    "<%=@first_name%> was smote by a wild-eyed, rubber-chicken-wielding assassin.",
    "<%=@first_name%> was scratched off the surface of the earth after an untimely and unfortunate encounter with a rubber-chicken carrying assassin.",
    "<%=@first_name%> died as a result of a humorous yet persistent assault via rubber chicken.",
    "<%=@first_name%> was ruthlessly bludgeoned to death with a rubber chicken wielded by an assassin."
  ]

  LEAVING_BEHIND = [
    "<%=@he_she.capitalize%> leaves behind <%=@fb_friends_count%> friends"
  ]

  LEAVING_BEHIND2 = [
    "was known for <%=@his_her%> mad, mad Chutes and Ladders skills.",
    "was known for a love of wasabi.",
    "was known for a love of mustard packets.",
    "was known for a love of clean coffee cups.",
    "was known for a love of ballpoint pens.",
    "was known for a hatred of books with no pictures.",
    "was known for a hatred of salamanders.",
    "was known for a hatred of orange foods.",
    "was known for a hatred of people who wear their pants too high.",
    "was known for a love of oatmeal cookies.",
    "was fondly remembered for a love of elevators but not glass ones.",
    "was fondly remembered for a love of steel drums.",
    "was known for a love of licorice.",
    "will always be fondly remembered for a love of fluorescent lighting.",
    "will always be remembered for a love of pink suede high heels.",
    "will always be remembered for a love of tree frogs.",
    "was known for a love of tree frogs.",
    "was dearly remembered by a love of Kenny G's smooth melodies.",
    "was known for a love of window treatments.",
    "was fondly remembered for an interest in orangutans.",
    "will always be remembered for a love of green lollipops.",
    "was known for a love of toast.",
    "was known for a love of daffodils and porcupines.",
    "was sorely missed by the barflies at Mickey's Bar and Grill, a favourite Friday hangout for the better part of 10 years until that untimely fire back in '02.",
    "was sorely missed by the local 401 veterans unit.",
    "was a proud supporter of the nudist colony in the next town over.",
    "a beautiful set of crocheted cushion covers.",
    "a bicycle built for two.",
    "<%=@his_her%> favourite goldfish.",
    "an extensive porn collection.",
    "several squirrels who live in a tree outside <%=@his_her%> home.",
    "7 cats.",
    "an extensive DVD collection featuring a rare collector's edition of <%=@favorite_movie%>."
  ]

  FINAL_WORDS = [
    "Friends will always remember how <%=@he_she%> recently said \"<%=@last_status_update%>\".",
    "<%=@first_name%>'s final words were \"<%=@last_status_update%>\".",
    "<%=@first_name%> received world-wide acclaim recently when <%=@he_she%> stated \"<%=@last_status_update%>\".",
    "Witnesses reported that <%=@first_name%>'s final statement to the world was \"<%=@last_status_update%>\".",
    "<%=@first_name%>'s family knows that it will bring comfort to all to know that <%=@his_her%> final words were \"<%=@last_status_update%>\".",
    "<%=@first_name%> asked to be remembered by <%=@his_her%> final words, \"<%=@last_status_update%>\"."
  ]

  RANDOM_FACTS = [
  ]

  ASSASSIN_SECTION = [
    "Authorities are searching for the leading suspect who was last seen fleeing <%=@location%> holding a worn and beaten rubber chicken. Identified as one <%=@assassin_full_name%>, a known rubber-chicken assassin, police have released the following photo: <div class=\"assassin_photo\"><img src='<%=@assassin_photo_url%>'/></div>",
    "Authorities are searching for the leading suspect who was last seen fleeing <%=@location%> holding a heavily-tattered rubber chicken. Identified as one <%=@assassin_full_name%>, a known rubber-chicken assassin, police have released the following photo: <div class=\"assassin_photo\"><img src='<%=@assassin_photo_url%>'/></div>",
    "Authorities are searching for the leading suspect who was last seen fleeing <%=@location%> holding a limp rubber chicken. Identified as one <%=@assassin_full_name%>, a known rubber-chicken assassin, police have released the following photo: <div class=\"assassin_photo\"><img src='<%=@assassin_photo_url%>'/></div>",
    "Authorities are searching for the leading suspect who was last seen fleeing <%=@location%> holding a deflated rubber chicken. Identified as one <%=@assassin_full_name%>, a known rubber-chicken assassin, police have released the following photo: <div class=\"assassin_photo\"><img src='<%=@assassin_photo_url%>'/></div>",
    "Authorities are searching for the leading suspect who was last seen fleeing <%=@location%> holding an exhausted rubber chicken. Identified as one <%=@assassin_full_name%>, a known rubber-chicken assassin, police have released the following photo: <div class=\"assassin_photo\"><img src='<%=@assassin_photo_url%>'/></div>"
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
<<<<<<< HEAD
    @access_token = '2227470867|2.k8m9P5zT7az2PcNEcAdXeQ__.3600.1297630800-511852582|MBT1pJ-C76QB5_oLSw3iWnZW3JE'
=======
    @access_token = '2227470867|2.fG5_UFptDCqPVC9d_4o03g__.3600.1297627200-120406278|F9VhrETi1dHVKtb7UP3LT7I7jpE'
>>>>>>> 4aef87fa4f6e1782d1d1ae3319cb871ca1be7852

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
    @assassin_section = ASSASSIN_SECTION.first
    @join_assassin = JOIN_ASSASSIN.first
  end
end
