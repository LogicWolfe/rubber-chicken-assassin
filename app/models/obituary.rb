class Obituary < ActiveRecord::Base
  belongs_to :kill
  image_accessor :assassin_photo

  LAST_STATUS_UPDATE = [
    "I'm not going to buy my kids an encyclopedia. Let them walk to school like I did",
    "I like the color red because it's a fire. And I see myself as always being on fire",
    "I am sweating out the vodka to make room for the whiskey tonight",
    "If we aren't supposed to eat animals, why are they made of meat?",
    "Why is the alphabet in that order? is it because of that song?",
    "Strangers have the best candy"
  ]

  FAV_BOOK = [
    "Curious George Visits The Proctologist",
    "Zen and the Art of Bikini Waxing",
    "The Dummies Guide to Making Love",
    "Savage Passion",
    "Truth, Dare, or Handcuffs",
    "Songs of the Humpback Whale",
    "I Wish I Knew How to Quit You",
    "I Heart You, You Haunt Me",
    "Are You There Vodka? It's Me Chelsea",
    "The Stainless Steel Rat Saves the World",
    "The Complete Idiot's Guide to Understanding Intelligent Design"
  ]

  FAV_MOVIE = [
    "Attack of the 50' Woman",
    "Garfield: The Movie",
    "Bridges of Madison County",
    "Conan the Barbarian",
    "Police Academy 6",
    "Macho Sluts",
    "Spiderman 3",
    "Howard the Duck",
    "Mac and Me",
    "Highlander 2: The Quickening",
    "It's Pat",
    "Showgirls",
    "Battlefield Earth",
    "Gigli",
    "Catwoman",
    "Son of the Mask"
  ]

  FAV_BAND = [
    "Bananarama",
    "Michael Bolton",
    "Justin Bieber",
    "The Backstreet Boys",
    "David Hasselhoff",
    "The Bacon Brothers",
    "Blink 182",
    "Creed",
    "Nickelback",
    "Limp Bizkit",
    "The Insane Clown Posse",
    "Bon Jovi",
    "Genesis",
    "Jonas Brothers"
  ]
  
  RECENT_EVENT = [
    "Michael Franti Plays At The Forum",
    "Care Bears LIVE",
    "Dinner at Aunt Shirley's",
    "Smurfs On Ice",
    "Betty's 34th Birthday"
  ]

  def favorite_book
    if (read_attribute(:favorite_book))
      read_attribute(:favorite_book)
    else
      result = randomize(FAV_BOOK)
      result.meta.generated = true
      result
    end
  end

  def favorite_movie
    if (read_attribute(:favorite_movie))
      read_attribute(:favorite_movie)
    else
      result = randomize(FAV_MOVIE)
      result.meta.generated = true
      result
    end
  end
  
  def favorite_band
    if (read_attribute(:favorite_band))
      read_attribute(:favorite_band)
    else
      result = randomize(FAV_BAND)
      result.meta.generated = true
      result
    end
  end
  
  def recent_event
    if (read_attribute(:recent_event))
      read_attribute(:recent_event)
    else
      result = randomize(RECENT_EVENT)
      result.meta.generated = true
      result
    end
  end
  
  def last_status_update
    if (read_attribute(:last_status_update))
      read_attribute(:last_status_update)
    else
      result = randomize(LAST_STATUS_UPDATE)
      result.meta.generated = true
      result
    end
  end
  
  def fb_friends_count
    if (read_attribute(:fb_friends_count))
      read_attribute(:fb_friends_count)
    else
      result = "many"
      result.meta.generated = true
      result
    end
  end

  private
  def randomize(arr)
    r = Random.new(self.id.to_i+arr.length)
    return arr[r.rand(arr.length)]
  end

end
