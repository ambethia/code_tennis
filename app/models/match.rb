class Match < ActiveRecord::Base
  MAX_PLAYERS = 2
  named_scope :with_openings, :conditions => ["matches.players_count < ?", MAX_PLAYERS]
  named_scope :incomplete,    :conditions => {"matches.completed_at" => nil}
  named_scope :complete,      :conditions =>  "matches.completed_at IS NOT NULL"
  
  belongs_to :admin, :class_name => "User"
  has_many :players
  has_many :users, :through => :players
  has_many :volleys

  validates_presence_of   :admin_id
  validates_presence_of   :name
  validates_uniqueness_of :name
  validates_presence_of   :github_user
  validates_presence_of   :github_project

  attr_accessor :admin_is_player

  # Add the admin to the match by default
  def after_initialize
    self.admin_is_player ||= true
  end
  
  def after_create
    users << admin if admin_is_player && (admin_is_player != "0") # 0/1 checkbox, ug.
  end

  def github_url
    "http://github.com/#{github_user}/#{github_project}"
  end

  def active_volley
    volleys.incomplete.first
  end
  
  def current_player
    self.active_volley ? self.active_volley.player : players.first
  end

  def next_player
    players.first(:conditions => "id != #{current_player.id}")
  end

  def push(payload)
    commits = ActiveSupport::JSON.decode(payload)["commits"]
    dirty = false
    commits.each do |commit|
      user = self.users.find_by_email(commit["author"]["email"])
      if user
        dirty = true
        self.active_volley.commits.create({
          :guid    => commit["id"],
          :url     => commit["url"],
          :message => commit["message"],
          :player  => self.players.find_by_user_id(user.id)
        })
        new_volley if commit["message"] =~ /volley/
      end
    end
    if dirty
      self.updated_at = Time.now
      self.save!
    end
  end

  def complete?
    !!(self.completed_at)
  end

  def complete!
    self.update_attribute :completed_at, Time.now
  end

  def volley!
    player = self.next_player || self.current_player
    self.active_volley.update_attribute(:completed_at, Time.now) unless volleys.empty?
    self.volleys.create(:player => player) unless complete?
    Twitter.update("@#{player.twitter_name} You're up for the next volley on #{self.name} (http://#{ENV['HOSTNAME']}/matches/#{self.id})") if player.twitter_name
  end

  def possible_admins
    users = players.map(&:user)
    (users << admin).uniq
  end
  
  def active?
    self.active
  end
  
end
