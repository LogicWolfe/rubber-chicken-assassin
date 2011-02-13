class Obituary < ActiveRecord::Base
  belongs_to :kill
  image_accessor :assassin_photo
end
