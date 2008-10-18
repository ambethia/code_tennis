require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Match do
  fixtures :matches

  it "should generate a github url" do
    matches(:puppy_hospital).github_url.should == "http://github.com/dedguy/puppy-hospital"
  end
end

