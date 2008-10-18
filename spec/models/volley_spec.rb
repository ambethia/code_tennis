require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Volley do
  before(:each) do
    @valid_attributes = {
      :player => mock_model(Player),
      :match  => mock_model(Match, :notify_players => true),
      :completed_at => Time.now
    }
  end

  it "should create a new instance given valid attributes" do
    Volley.create!(@valid_attributes)
  end
end
