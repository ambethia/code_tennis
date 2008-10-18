require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/players/index.html.erb" do
  include PlayersHelper
  
  before(:each) do
    assigns[:players] = [
      stub_model(Player,
        :user_id  => 1,
        :match_id => 1
      ),
      stub_model(Player,
      :user_id  => 2,
      :match_id => 1
      )
    ]
  end

  it "should render list of players" do
    render "/players/index.html.erb"
  end
end

