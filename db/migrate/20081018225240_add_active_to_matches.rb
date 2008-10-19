class AddActiveToMatches < ActiveRecord::Migration
  def self.up
    add_column :matches, :active, :boolean, :default => true
  end

  def self.down
    remove_column :matches, :active
  end
end
