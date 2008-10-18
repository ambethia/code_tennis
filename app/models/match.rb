class Match < ActiveRecord::Base
  belongs_to :admin, :class_name => "User"
  has_many :players
  has_many :users, :through => :players
  has_many :volleys

  validates_presence_of :admin_id
  validates_presence_of :name
  validates_presence_of :github_user
  validates_presence_of :github_project

  def github_url
    "http://github.com/#{github_user}/#{github_project}"
  end
  
  def active_volley
    volleys.find(:first, :conditions => {"completed_at" => nil})
  end
  
  def push(payload)
    commits = ActiveSupport::JSON.decode(payload)["commits"]
    commits.each do |commit|
      user = self.users.find_by_email(commit["author"]["email"])
      self.active_volley.commits.create({
        :message => commit["message"],
        :player  => self.players.find_by_user_id(user.id)
      })
    end
  end
end
