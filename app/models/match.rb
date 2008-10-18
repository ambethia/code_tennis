class Match < ActiveRecord::Base
  belongs_to :admin, :class_name => "User"

  validates_presence_of :admin_id
  validates_presence_of :name
  validates_presence_of :github_user
  validates_presence_of :github_project

  def github_url
    "http://github.com/#{github_user}/#{github_project}"
  end
end
