class CreateVolleys < ActiveRecord::Migration
  def self.up
    create_table :volleys do |t|
      t.integer :player_id
      t.integer :match_id
      t.timestamp :completed_at

      t.timestamps
    end
  end

  def self.down
    drop_table :volleys
  end
end
