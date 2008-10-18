class Volley < ActiveRecord::Base
  belongs_to :match
  belongs_to :player
  has_many :commits

  validates_presence_of :player_id
  validates_presence_of :match_id
end
