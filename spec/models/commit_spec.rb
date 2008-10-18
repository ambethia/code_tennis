require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Commit do
  before(:each) do
    @valid_attributes = {
      :volley_id => 1,
      :player_id => 1,
      :message => "...a Nerkle, a Nerd, and a Seersucker too. [volley]"
    }
  end

  it "should create a new instance given valid attributes" do
    Commit.create!(@valid_attributes)
  end
end
