class CreateKills < ActiveRecord::Migration
  def self.up
    create_table :kills do |t|
      t.integer :killer_id
      t.integer :victim_id
      t.string :location
      t.string :photo_uid
      t.string :attack_sequence

      t.timestamps
    end
  end

  def self.down
    drop_table :kills
  end
end
