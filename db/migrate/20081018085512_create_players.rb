class CreatePlayers < ActiveRecord::Migration
  def self.up
    create_table :players do |t|
      t.integer :match_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :players
  end
end
