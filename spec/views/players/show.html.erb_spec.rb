require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/players/show.html.erb" do
  include PlayersHelper
  
  before(:each) do
    assigns[:player] = @player = stub_model(Player,
      :user_id  => 1,
      :match_id => 1
    )
  end

  it "should render attributes in <p>" do
    render "/players/show.html.erb"
  end
end

