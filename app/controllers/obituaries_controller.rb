class ObituariesController < ApplicationController
  INTRO = [
    ["Embracing our spirituality we celebrate the life of <%=@first_name%> <%=@last_name%> on <%=@full_date%>.", :@full_date, :@first_name, :@last_name],
    ["Together we mourn the loss of <%=@first_name%> <%=@last_name%> on <%=@full_date%>.", :@full_date, :@first_name, :@last_name],
    ["With moderate regret we inform you of the loss of <%=@first_name%> <%=@last_name%> on <%=@full_date%>.", :@full_date, :@first_name, :@last_name],
    ["With marginal regret we announce the loss of <%=@first_name%> <%=@last_name%> on <%=@full_date%>.", :@full_date, :@first_name, :@last_name],
    ["With not as much sadness as we expected we announce the passing of <%=@first_name%> <%=@last_name%> on <%=@full_date%>.", :@full_date, :@first_name, :@last_name],
    ["We most insincerely announce the departure of <%=@first_name%> <%=@last_name%> on <%=@full_date%>.", :@full_date, :@first_name, :@last_name],
    ["We most sincerely announce the departure of <%=@first_name%> <%=@last_name%> on <%=@full_date%>.", :@full_date, :@first_name, :@last_name],
    ["With deepest regrets we inform you about the loss of <%=@first_name%> <%=@last_name%> on <%=@full_date%>.", :@full_date, :@first_name, :@last_name],
    ["We regret to announce the sudden passing of <%=@first_name%> <%=@last_name%> on <%=@full_date%>.", :@full_date, :@first_name, :@last_name]
  ]

  DEATH_DESC = [
    ["<%=@first_name%> was maliciously murdered by <%=@sequence_last_blow%> strike from a rubber chicken.", :@first_name, :@sequence_last_blow],
    ["<%=@first_name%> was tragically assassinated; an autopsy has revealed that a deadly <%=@sequence_last_blow%> blow from a rubber chicken was the cause of death.", :@first_name, :@sequence_last_blow],
    ["<%=@first_name%> was viciously decapitated by a <%=@sequence_last_blow%> strike from a rubber chicken.", :@first_name, :@sequence_last_blow],
    ["<%=@first_name%> kicked the bucket after receiving <%=@number_blows%> comical whacks to the head by a rubber chicken.", :@first_name, :@number_blows],
    ["<%=@first_name%> was quickly rendered lifeless after receiving <%=@number_blows%> blows to the head from the business end of a rubber chicken.", :@first_name, :@number_blows],
    ["<%=@first_name%> was bludgeoned to death from <%=@number_blows%> blows to the head delivered via rubber chicken.", :@first_name, :@number_blows],
    ["<%=@first_name%> breathed <%=@his_her%> last breath shortly after receiving <%=@number_blows%> blows to the head from the deadly end of a rubber chicken.", :@first_name, :@his_her, :@number_blows],
    ["<%=@first_name%> left this world violently after receiving <%=@number_blows%> noisy whacks to the head by a rubber chicken.", :@first_name, :@number_blows],
    ["<%=@first_name%> was whacked, figuratively and literally, by a rubber-chicken wielding assassin.", :@first_name],
    ["<%=@first_name%> was smote by a wild-eyed, rubber-chicken-wielding assassin.", :@first_name],
    ["<%=@first_name%> was scratched off the surface of the earth after an untimely and unfortunate encounter with a rubber-chicken carrying assassin.", :@first_name],
    ["<%=@first_name%> died as a result of a humorous yet persistent assault via rubber chicken.", :@first_name],
    ["<%=@first_name%> was ruthlessly bludgeoned to death with a rubber chicken wielded by an assassin." :@first_name],
  ]

  LEAVING_BEHIND = [
    ["<%=@he_she.capitalize%> leaves behind <%=@fb_friends_count%> friends", :@he_she, :@fb_friends_count]
  ]

  LEAVING_BEHIND2 = [
    ["an expansive collection of commemorative teaspoons, including a 6-piece collector set from <%=@recent_event%>.", :@recent_event],
    ["a most beloved collection of <%=@favorite_band%> t-shirts.", :@favorite_band],
    ["an extensive bookshelf of literature including a signed copy of <%=@favorite_book%>.", :@favorite_book],
    ["an expansive collection of tea cozies."],
    ["an extensive DVD collection featuring a rare collector's edition of <%=@favorite_movie%>.", :@favorite_movie],
    ["was known for <%=@his_her%> mad, mad Chutes and Ladders skills.", :@his_her],
    ["was known for a love of wasabi."],
    ["was known for a love of mustard packets."],
    ["was known for a love of clean coffee cups."],
    ["was known for a love of ballpoint pens."],
    ["was known for a hatred of books with no pictures."],
    ["was known for a hatred of salamanders."],
    ["was known for a hatred of orange foods."],
    ["was known for a hatred of people who wear their pants too high."],
    ["was known for a love of oatmeal cookies."],
    ["was fondly remembered for a love of elevators but not glass ones."],
    ["was fondly remembered for a love of steel drums."],
    ["was known for a love of licorice."],
    ["will always be fondly remembered for a love of fluorescent lighting."],
    ["will always be remembered for a love of pink suede high heels."],
    ["will always be remembered for a love of tree frogs."],
    ["was known for a love of tree frogs."],
    ["was dearly remembered by a love of Kenny G's smooth melodies."],
    ["was known for a love of window treatments."],
    ["was fondly remembered for an interest in orangutans."],
    ["will always be remembered for a love of green lollipops."],
    ["was known for a love of toast."],
    ["was known for a love of daffodils and porcupines."],
    ["was sorely missed by the barflies at Mickey's Bar and Grill, a favorite Friday hangout for the better part of 10 years until that untimely fire back in '02."],
    ["was sorely missed by the local 401 veterans unit."],
    ["was a proud supporter of the nudist colony in the next town over."],
    ["a beautiful set of crocheted cushion covers."],
    ["a bicycle built for two."],
    ["<%=@his_her%> favorite goldfish.", :@his_her],
    ["an extensive porn collection."],
    ["several squirrels who live in a tree outside <%=@his_her%> home.", :@his_her],
    ["7 cats."]
  ]

  FINAL_WORDS = [
    ["Friends will always remember how <%=@he_she%> recently said \"<%=@last_status_update%>\".", :@he_she, :@last_status_update],
    ["<%=@first_name%>'s final words were \"<%=@last_status_update%>\".", :@first_name, :@last_status_update],
    ["<%=@first_name%> received world-wide acclaim recently when <%=@he_she%> stated \"<%=@last_status_update%>\".", :@first_name, :@he_she, :@last_status_update],
    ["Witnesses reported that <%=@first_name%>'s final statement to the world was \"<%=@last_status_update%>\".", :@first_name, :@last_status_update],
    ["<%=@first_name%>'s family knows that it will bring comfort to all to know that <%=@his_her%> final words were \"<%=@last_status_update%>\".", :@first_name, :@his_her, :@last_status_update],
    ["<%=@first_name%> asked to be remembered by <%=@his_her%> final words, \"<%=@last_status_update%>\".", :@first_name, :@his_her, :@last_status_update]
  ]

  ASSASSIN_SECTION = [
    "Authorities are searching for the leading suspect who was last seen fleeing <%=@location%> holding a worn and beaten rubber chicken. Identified as one <%=@assassin_full_name%>, a known rubber-chicken assassin. Police have released the following photo: <div class=\"assassin_photo\"><img src='<%=@assassin_photo_url%>'/></div>",
    "Authorities are searching for the leading suspect who was last seen fleeing <%=@location%> holding a heavily-tattered rubber chicken. Identified as one <%=@assassin_full_name%>, a known rubber-chicken assassin. Police have released the following photo: <div class=\"assassin_photo\"><img src='<%=@assassin_photo_url%>'/></div>",
    "Authorities are searching for the leading suspect who was last seen fleeing <%=@location%> holding a limp rubber chicken. Identified as one <%=@assassin_full_name%>, a known rubber-chicken assassin. Police have released the following photo: <div class=\"assassin_photo\"><img src='<%=@assassin_photo_url%>'/></div>",
    "Authorities are searching for the leading suspect who was last seen fleeing <%=@location%> holding a deflated rubber chicken. Identified as one <%=@assassin_full_name%>, a known rubber-chicken assassin. Police have released the following photo: <div class=\"assassin_photo\"><img src='<%=@assassin_photo_url%>'/></div>",
    "Authorities are searching for the leading suspect who was last seen fleeing <%=@location%> holding an exhausted rubber chicken. Identified as one <%=@assassin_full_name%>, a known rubber-chicken assassin. Police have released the following photo: <div class=\"assassin_photo\"><img src='<%=@assassin_photo_url%>'/></div>"
  ]

  JOIN_ASSASSIN = [
    "Concerned family encourage all of <%=@first_name%>'s friends to join the bounty hunt at <a href='http://www.chickenassassin.com'>www.chickenassassin.com</a>"
  ]
  
  def index
  end

  def show
    @obituary = Obituary.find(params[:id])
    @random = Random.new(@obituary.id)
    
    if (@obituary.gender == "male")
      @he_she = "he";
      @his_her = "his";
    elsif (@obituary.gender == "female")
      @he_she = "she";
      @his_her = "her";
    else #user did not specify gender.
      @he_she = "it";
      @his_her = "its";
    end

    @first_name = @obituary.first_name
    @last_name = @obituary.last_name

    @full_date = @obituary.kill.kill_date.strftime("%B %d, %Y")
    @time_killed = @obituary.kill.kill_date.strftime("%I:%M %p")

    @assassin_full_name = @obituary.assassin_full_name

    if (@obituary.assassin_photo.process(:sepia).url.nil?)
      @assassin_photo_url = "https://graph.facebook.com/#{@obituary.kill.killer_id}/picture?type=large"
    else
      @assassin_photo_url = @obituary.assassin_photo.process(:sepia).url
    end

    @fb_friends_count = @obituary.fb_friends_count
    @favorite_movie = @obituary.favorite_movie
    @favorite_band = @obituary.favorite_band
    @favorite_book = @obituary.favorite_book
    @last_status_update = @obituary.last_status_update

    @sequence_array = @obituary.kill.attack_sequence.split('')
    @number_blows = @sequence_array.length
    @char_to_txt_map = {
      "L" => "a forehand",
      "R" => "a backhand",
      "U" => "an uppercut",
      "D" => "a slashing",
      "F" => "a beak first",
      "B" => "a beak first"
    }
    
    @sequence_last_blow = @char_to_txt_map[@sequence_array[@sequence_array.length - 1]]
    @recent_event = @obituary.recent_event

    @location = @obituary.location

    #for testing individual strings - make the entry you want to test the first in the array
    # @intro = INTRO.first
    # @death_desc = DEATH_DESC.first
    # @leaving_behind = LEAVING_BEHIND.first
    # @leaving_behind2 = LEAVING_BEHIND2.first
    # @final_words = FINAL_WORDS.first
    # @assassin_section = ASSASSIN_SECTION.first
    # @join_assassin = JOIN_ASSASSIN.first

    # Uncomment this to show random lines from each part
    @intro = randomize(INTRO)
    @death_desc = randomize(DEATH_DESC)
    @leaving_behind = randomize(LEAVING_BEHIND)
    @leaving_behind2 = randomize(LEAVING_BEHIND2)
    @final_words = randomize(FINAL_WORDS)
    @assassin_section = randomize(ASSASSIN_SECTION)
    @join_assassin = randomize(JOIN_ASSASSIN)
  end

  def randomize(array)
    results = array.map {|entry|
      if (!entry.kind_of? Array)
        entry
      else
        value = entry.first
        passed = true
        entry[1..-1].each {|requirement|
          req_value = instance_variable_get(requirement)
          if (req_value.nil? || req_value.meta.generated)
            passed = false
          end
        }
        if passed
          value
        else
          nil
        end
      end
    }

    results.compact!

    if (results.empty?)
      results = array.map {|entry|
        if (!entry.kind_of? Array)
          entry
        else
          entry.first
        end
      }
    end

    return results[@random.rand(array.size)]
  end
end
