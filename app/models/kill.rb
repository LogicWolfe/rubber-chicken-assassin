class Kill < ActiveRecord::Base
  image_accessor :photo
  has_one :obituary

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
    self.favorite_book || FAV_BOOK[rand(FAV_BOOK.length)]
  end

  def favorite_movie
    self.favorite_movie || FAV_MOVIE[rand(FAV_MOVIE.length)]
  end
  
  def favorite_band
    self.favorite_band || FAV_BAND[rand(FAV_BAND.length)]
  end
  
  def recent_event
    self.recent_event || RECENT_EVENT[rand(RECENT_EVENT.length)]
  end
  
  def fb_friends_count
    self.fb_friends_count || rand(150)
  end

  def attack_sequence=(val)
    write_attribute(:attack_sequence, val.upcase)
  end
end
