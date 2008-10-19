require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Match do
  fixtures :matches, :volleys, :players, :users

  before do
    @match  = matches(:binary_frisbee)
    @volley = volleys(:dedguy_frisbee)
    @player = players(:dedguy_frisbee)
  end

  it "should generate a github url" do
    matches(:puppy_hospital).github_url.should == "http://github.com/dedguy/puppy-hospital"
  end
  
  it "should know the active Volley" do
    @match.active_volley.should == volleys(:ambethia_frisbee)
  end

  describe "with github push" do
    
    before(:each) do
      @payload = File.open(fixture_path + "/github/payload.js").read
      @match.stub!(:active_volley).and_return(@volley)
      @match.stub!(:users).and_return(stub("ARProxy", :[] => [], :find_by_email => @player))
    end

    it "should create many commits" do
      @volley.commits.should_receive(:create).twice
    end
    
    it "should find the player" do
      @match.users.should_receive(:find_by_email).with("ambethia@example.com").twice
    end

    after(:each) do
      @match.push(@payload)
    end

  end

  describe "possible admins" do

    it "should not include users that aren't playing" do
      matches(:binary_frisbee).possible_admins.should_not include(users(:madcowley))
    end
    
    it "should not include admin twice if they're playing" do
      matches(:binary_frisbee).possible_admins.size.should == 2
    end

  end
  
  describe "volley receives a commit" do
    it "should update the match updated_at timestamp" do
      @payload = File.open(fixture_path + "/github/payload.js").read
      @match.should_receive(:updated_at=)
      @match.push(@payload)
    end
  end
  
end

