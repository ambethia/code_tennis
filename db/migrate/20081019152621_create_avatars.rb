class CreateAvatars < ActiveRecord::Migration
  def self.up
    create_table :avatars do |t|
      t.string :name
      t.string :filename

      t.timestamps
    end
    add_column :users, :avatar_id, :integer
    add_column :players, :color, :string
  end

  def self.down
    drop_table :avatars
    remove_column :users, :avatar_id
    remove_column :players, :color
  end
end
