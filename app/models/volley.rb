class Volley < ActiveRecord::Base
  belongs_to :match
  belongs_to :player
  has_many :commits

  validates_presence_of :player_id
  validates_presence_of :match_id
  
  def after_save
    if !self.completed_at.nil?
      self.match.notify_players
    end
  end
end
