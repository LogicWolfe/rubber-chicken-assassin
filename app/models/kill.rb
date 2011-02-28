class Kill < ActiveRecord::Base
  image_accessor :photo
  has_one :obituary

  def attack_sequence=(val)
    write_attribute(:attack_sequence, val.upcase)
  end
end
