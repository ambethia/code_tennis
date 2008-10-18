class User < ActiveRecord::Base
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
end
