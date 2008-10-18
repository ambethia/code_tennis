require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe User do
  fixtures :users

  it "should generate a github url" do
    users(:ambethia).github_url.should == "http://github.com/ambethia"
  end
  
  it "should have errors on an invalid email address" do
    user = User.new(:email => "foo2example.com")
    user.valid?
    user.should have(1).errors_on(:email)
  end
end
