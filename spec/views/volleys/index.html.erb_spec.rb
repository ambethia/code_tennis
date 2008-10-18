require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/volleys/index.html.erb" do
  include VolleysHelper
  
  before(:each) do
    assigns[:volleys] = [
      stub_model(Volley,
        :player_id => 1,
        :match_id  => 1
      ),
      stub_model(Volley,
        :player_id => 2,
        :match_id  => 1
      )
    ]
  end

  it "should render list of volleys" do
    render "/volleys/index.html.erb"
  end
end

