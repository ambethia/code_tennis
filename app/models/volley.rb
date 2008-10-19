class Volley < ActiveRecord::Base
  named_scope :incomplete, :conditions => {"volleys.completed_at" => nil}
  named_scope :complete,   :conditions => "volleys.completed_at IS NOT NULL"

  belongs_to :match
  belongs_to :player
  has_many :commits

  validates_presence_of :player_id
  validates_presence_of :match_id

  # def after_save
  #   if !self.user.nil?
  #     self.match.notify_players
  #   end
  # end
end
