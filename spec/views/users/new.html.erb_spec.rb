require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/users/new.html.erb" do
  include UsersHelper
  
  before(:each) do
    assigns[:user] = stub_model(User,
      :new_record? => true,
      :fullname => "value for fullname",
      :nickname => "value for nickname",
      :email => "value for email",
      :url => "value for url",
      :identity_url => "value for identity_url",
      :github_user => "value for github_user",
      :time_zone => "value for time_zone"
    )
  end

  it "should render new form" do
    render "/users/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", users_path) do
      with_tag("input#user_fullname[name=?]", "user[fullname]")
      with_tag("input#user_nickname[name=?]", "user[nickname]")
      with_tag("input#user_email[name=?]", "user[email]")
      with_tag("input#user_url[name=?]", "user[url]")
      with_tag("input#user_identity_url[name=?]", "user[identity_url]")
      with_tag("input#user_github_user[name=?]", "user[github_user]")
      with_tag("input#user_time_zone[name=?]", "user[time_zone]")
    end
  end
end


