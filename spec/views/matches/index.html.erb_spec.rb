require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/matches/index.html.erb" do
  include MatchesHelper
  
  before(:each) do
    assigns[:matches] = [
      stub_model(Match,
        :name        => "value for name",
        :description => "value for description"
      ),
      stub_model(Match,
        :name        => "value for name",
        :description => "value for description"
      )
    ]
  end

  it "should render list of matches" do
    render "/matches/index.html.erb"
    response.should have_tag("tr>td", "value for name", 2)
    response.should have_tag("tr>td", "value for description", 2)
  end
end

