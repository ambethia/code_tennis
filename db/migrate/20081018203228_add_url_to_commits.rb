class AddUrlToCommits < ActiveRecord::Migration
  def self.up
    add_column :commits, :url, :string
  end

  def self.down
    remove_column :commits, :url
  end
end
