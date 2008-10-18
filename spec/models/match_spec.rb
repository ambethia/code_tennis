require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Match do
  fixtures :matches, :volleys, :players

  before do
    @match  = matches(:binary_frisbee)
    @volley = volleys(:dedguy_frisbee)
    @player = players(:dedguy_frisbee)
  end

  it "should generate a github url" do
    matches(:puppy_hospital).github_url.should == "http://github.com/dedguy/puppy-hospital"
  end
  
  it "should know the active Volley" do
    @match.active_volley.should == @volley
  end

  describe "with github push" do
    
    before(:each) do
      @payload = File.open(fixture_path + "/github/payload.js").read
      @match.stub!(:active_volley).and_return(@volley)
      @match.stub!(:players).and_return(stub("ARProxy", :[] => [], :find_by_email => @player))
    end

    it "should create many commits" do
      @volley.commits.should_receive(:create).twice
    end
    
    it "should find the player" do
      @match.players.should_receive(:find_by_email).with("jasper@ambethia.com").twice
    end

    after(:each) do
      @match.push(@payload)
    end

  end
end

