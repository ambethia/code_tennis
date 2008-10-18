require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Player do
  before(:each) do
    @valid_attributes = {
      :match_id => "1",
      :user_id => "1"
    }
  end

  it "should create a new instance given valid attributes" do
    Player.create!(@valid_attributes)
  end
end
