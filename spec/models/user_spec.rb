require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe User do
  before(:each) do
    @valid_attributes = {
      :fullname => "value for fullname",
      :nickname => "value for nickname",
      :email => "value for email",
      :url => "value for url",
      :identity_url => "value for identity_url",
      :github_user => "value for github_user",
      :time_zone => "value for time_zone"
    }
  end

  it "should create a new instance given valid attributes" do
    User.create!(@valid_attributes)
  end
end
