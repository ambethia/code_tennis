class Player < ActiveRecord::Base
  belongs_to :user
  belongs_to :match, :counter_cache => true
  has_many :commits
  
  validates_presence_of :user_id
  validates_presence_of :match_id

  delegate :twitter_name, :to => :user
  delegate :display_name, :to => :user 
  delegate :avatar,       :to => :user
  
  def name(options = {})
    options[:short] ? user.nickname : user.display_name
  end
end
