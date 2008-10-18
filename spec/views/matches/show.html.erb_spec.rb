require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/matches/show.html.erb" do
  include MatchesHelper
  
  before(:each) do
    assigns[:match] = @match = stub_model(Match,
      :name           => "Puppy Hospital",
      :description    => "The average salary for puppy hospital jobs is $43,000.",
      :github_user    => "ambethia",
      :github_project => "puppy-hospital",
      :admin          => stub_model(User, :fullname => "Jason L Perry")
    )
  end

  it "should render attributes" do
    render "/matches/show.html.erb"
  end
end

