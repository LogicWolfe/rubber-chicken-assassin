class CreateObituaries < ActiveRecord::Migration
  def self.up
    create_table :obituaries do |t|
      t.integer :kill_id
      t.string :first_name
      t.string :last_name
      t.string :assassin_full_name
      t.string :assassin_photo_uid
      t.string :gender
      t.string :victim_photo_uid
      t.integer :fb_friends_count
      t.string :favorite_movie
      t.string :favorite_band
      t.string :favorite_book
      t.string :last_status_update
      t.string :location

      t.timestamps
    end
  end

  def self.down
    drop_table :obituaries
  end
end
