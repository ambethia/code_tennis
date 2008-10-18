class Player < ActiveRecord::Base
  belongs_to :user
  belongs_to :match
  has_many :commits
  
  validates_presence_of :user_id
  validates_presence_of :match_id
  
  delegate :twitter_name, :to => :user
end
