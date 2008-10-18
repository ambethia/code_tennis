class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :fullname
      t.string :nickname
      t.string :email
      t.string :url
      t.string :identity_url
      t.string :github_user
      t.string :time_zone

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
