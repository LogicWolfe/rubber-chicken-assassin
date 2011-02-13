class ObituariesController < ApplicationController
  INTRO = [
    "We regret to announce the sudden passing of <%=@first_name%> <%=@last_name%> on <%=@full_date%>."
  ]
  
  DEATH_DESC = [
    "<%=@first_name%> was ruthlessly bludgeoned to death with a rubber chicken wielded by an unknown assassin."
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
     assassinations to his name.  Police have released the following photo: <img src='<%=@assassin_photo_url%>'/>"
  ]
  
  JOIN_ASSASSIN = [
    "Concerned family encourage all of<%=@first_name%>'s friends to join the bounty hunt at <a href='www.chickenassassin.com'>www.chickenassassin.com</a>"
  ]
  
  def index
  end
  
  def show
    @first_name = "FIRST_NAME"
    @last_name = "LAST_NAME"
    @full_date = "FULL_DATE"
    @he_she = "HE_SHE"
    @his_her = "HIS_HER"
    @fb_friends_count = "FB_FRIENDS_COUNT"
    @favorite_movie = "FAVORITE_MOVIE"
    @favorite_band = "FAVORITE_BAND"
    @last_status_update = "LAST_STATUS_UPDATE"
    @location = "LOCATION"
    @assassin_full_name = "ASSASSIN_FULL_NAME"
    @assassin_photo_url = "http://www.google.ca/intl/en_com/images/srpr/logo1w.png"
    
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
