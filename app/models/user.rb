class User < ActiveRecord::Base
  has_many :players
  has_many :matches, :through => :players
  has_many :administrations, :class_name => "Match", :foreign_key => :admin_id
  
  validates_uniqueness_of :identity_url
  validates_presence_of   :identity_url

  validates_uniqueness_of :email
  validates_presence_of   :email
  validates_format_of     :email, :with => RFC822::EmailAddress

  validates_uniqueness_of :nickname
  validates_presence_of   :nickname

  def github_url
    "http://github.com/#{github_user}"
  end
  
  def display_name
    self.nickname? ? self.nickname : self.fullname
    
  end
end
