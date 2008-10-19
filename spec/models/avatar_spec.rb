require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Avatar do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :color => "value for color",
      :filename => "value for filename"
    }
  end

  it "should create a new instance given valid attributes" do
    Avatar.create!(@valid_attributes)
  end
end
