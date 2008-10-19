class AddPlayersCountToMatches < ActiveRecord::Migration
  def self.up
    add_column :matches, :players_count, :integer, :null => false, :default => 0
  end

  def self.down
    remove_column :matches, :players_count
  end
end
