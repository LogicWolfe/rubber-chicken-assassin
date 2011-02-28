class AddKillDateToKill < ActiveRecord::Migration
  def self.up
  	add_column :kills, :kill_date, :datetime
  end

  def self.down
  	remove_column :kills, :kill_date
  end
end
