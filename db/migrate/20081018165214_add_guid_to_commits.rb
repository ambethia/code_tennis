class AddGuidToCommits < ActiveRecord::Migration
  def self.up
    add_column :commits, :guid, :string
  end

  def self.down
    remove_column :commits, :guid
  end
end
