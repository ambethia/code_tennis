require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/avatars/show.html.erb" do
  include AvatarsHelper
  
  before(:each) do
    assigns[:avatar] = @avatar = stub_model(Avatar,
      :name => "value for name",
      :color => "value for color",
      :filename => "value for filename"
    )
  end

  it "should render attributes in <p>" do
    render "/avatars/show.html.erb"
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ color/)
    response.should have_text(/value\ for\ filename/)
  end
end

