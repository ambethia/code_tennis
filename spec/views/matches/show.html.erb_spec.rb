require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/matches/show.html.erb" do
  include MatchesHelper
  
  before(:each) do
    assigns[:match] = @match = stub_model(Match,
      :name => "value for name",
      :description => "value for description",
      :github_user => "value for github_user",
      :github_project => "value for github_project"
    )
  end

  it "should render attributes in <p>" do
    render "/matches/show.html.erb"
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ description/)
    response.should have_text(/value\ for\ github_user/)
    response.should have_text(/value\ for\ github_project/)
  end
end

