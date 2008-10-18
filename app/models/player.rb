class Player < ActiveRecord::Base
  belongs_to :user
  belongs_to :match
  
  validates_presence_of :user_id
  validates_presence_of :match_id
end
