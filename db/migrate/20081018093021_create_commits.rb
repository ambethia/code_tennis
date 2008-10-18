class CreateCommits < ActiveRecord::Migration
  def self.up
    create_table :commits do |t|
      t.integer :volley_id
      t.integer :player_id
      t.text :message

      t.timestamps
    end
  end

  def self.down
    drop_table :commits
  end
end
