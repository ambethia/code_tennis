require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/users/index.html.erb" do
  include UsersHelper
  
  before(:each) do
    assigns[:users] = [
      stub_model(User,
        :fullname => "value for fullname",
        :nickname => "value for nickname",
        :email => "value for email",
        :url => "value for url",
        :identity_url => "value for identity_url",
        :github_user => "value for github_user",
        :time_zone => "value for time_zone"
      ),
      stub_model(User,
        :fullname => "value for fullname",
        :nickname => "value for nickname",
        :email => "value for email",
        :url => "value for url",
        :identity_url => "value for identity_url",
        :github_user => "value for github_user",
        :time_zone => "value for time_zone"
      )
    ]
  end

  it "should render list of users" do
    render "/users/index.html.erb"
    response.should have_tag("tr>td", "value for fullname", 2)
    response.should have_tag("tr>td", "value for nickname", 2)
    response.should have_tag("tr>td", "value for email", 2)
    response.should have_tag("tr>td", "value for url", 2)
    response.should have_tag("tr>td", "value for identity_url", 2)
    response.should have_tag("tr>td", "value for github_user", 2)
    response.should have_tag("tr>td", "value for time_zone", 2)
  end
end

