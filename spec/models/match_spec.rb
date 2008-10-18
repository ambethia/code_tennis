require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Match do
  before(:each) do
    @valid_attributes = {
      :admin_id => "1",
      :name => "value for name",
      :description => "value for description",
      :github_user => "value for github_user",
      :github_project => "value for github_project"
    }
  end

  it "should create a new instance given valid attributes" do
    Match.create!(@valid_attributes)
  end
end
