class Commit < ActiveRecord::Base
  belongs_to :player
  belongs_to :volley

  validates_presence_of :message
  validates_presence_of :player_id
  validates_presence_of :volley_id
end
