class CreateMatches < ActiveRecord::Migration
  def self.up
    create_table :matches do |t|
      t.integer :admin_id
      t.string :name
      t.text :description
      t.string :github_user
      t.string :github_project

      t.timestamps
    end
  end

  def self.down
    drop_table :matches
  end
end
