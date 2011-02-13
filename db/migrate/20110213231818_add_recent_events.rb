class AddRecentEvents < ActiveRecord::Migration
  def self.up
    add_column :obituaries, :recent_event, :string
  end

  def self.down
    remove_column :obituaries, :recent_event, :string
  end
end
