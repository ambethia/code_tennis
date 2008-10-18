class Volley < ActiveRecord::Base
  belongs_to :player
  belongs_to :match
  
  validates_presence_of :player_id
  validates_presence_of :match_id
end
