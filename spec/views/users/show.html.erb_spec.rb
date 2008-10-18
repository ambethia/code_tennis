require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/users/show.html.erb" do
  include UsersHelper
  
  before(:each) do
    assigns[:user] = @user = stub_model(User,
      :fullname => "value for fullname",
      :nickname => "value for nickname",
      :email => "value for email",
      :url => "value for url",
      :identity_url => "value for identity_url",
      :github_user => "value for github_user",
      :time_zone => "value for time_zone"
    )
  end

  it "should render attributes in <p>" do
    render "/users/show.html.erb"
    response.should have_text(/value\ for\ fullname/)
    response.should have_text(/value\ for\ nickname/)
    response.should have_text(/value\ for\ email/)
    response.should have_text(/value\ for\ url/)
    response.should have_text(/value\ for\ identity_url/)
    response.should have_text(/value\ for\ github_user/)
    response.should have_text(/value\ for\ time_zone/)
  end
end

