class Kill < ActiveRecord::Base
  image_accessor :photo
  has_one :obituary
end
