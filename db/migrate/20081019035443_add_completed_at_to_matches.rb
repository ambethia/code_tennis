class AddCompletedAtToMatches < ActiveRecord::Migration
  def self.up
    add_column :matches, :completed_at, :timestamp
    remove_column :matches, :active
  end

  def self.down
    remove_column :matches, :completed_at
    add_column :matches, :active, :boolean
  end
end
