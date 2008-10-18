require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/volleys/index.html.erb" do
  include VolleysHelper
  
  before(:each) do
    assigns[:volleys] = [
      stub_model(Volley,
      ),
      stub_model(Volley,
      )
    ]
  end

  it "should render list of volleys" do
    render "/volleys/index.html.erb"
  end
end

