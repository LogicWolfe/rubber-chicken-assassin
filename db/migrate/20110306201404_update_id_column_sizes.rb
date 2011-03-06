class UpdateIdColumnSizes < ActiveRecord::Migration
  def self.up
	change_column :kills, :killer_id, :integer, :limit => 8
	change_column :kills, :victim_id, :integer, :limit => 8
  end

  def self.down
	change_column :kills, :killer_id, :integer
	change_column :kills, :victim_id, :integer
  end
end
