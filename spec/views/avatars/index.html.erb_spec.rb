require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/avatars/index.html.erb" do
  include AvatarsHelper
  
  before(:each) do
    assigns[:avatars] = [
      stub_model(Avatar,
        :name => "value for name",
        :color => "value for color",
        :filename => "value for filename"
      ),
      stub_model(Avatar,
        :name => "value for name",
        :color => "value for color",
        :filename => "value for filename"
      )
    ]
  end

  it "should render list of avatars" do
    render "/avatars/index.html.erb"
    response.should have_tag("tr>td", "value for name", 2)
    response.should have_tag("tr>td", "value for color", 2)
    response.should have_tag("tr>td", "value for filename", 2)
  end
end

