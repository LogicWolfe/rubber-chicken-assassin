class CreateKills < ActiveRecord::Migration
  def self.up
    create_table :kills do |t|
      t.integer :killer_id, :limit => 8
      t.integer :victim_id, :limit => 8
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
