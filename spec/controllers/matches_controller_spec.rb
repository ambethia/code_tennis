require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe MatchesController do

  before(:each) do
    @user = stub_model(User)
    controller.stub!(:current_user).and_return(@user)
  end

  def mock_match(stubs={})
    @mock_match ||= mock_model(Match, {:"admin=" => @user, :"admin" => @user}.merge(stubs))
  end
  
  describe "responding to GET index" do

    it "should expose all matches as @matches" do
      Match.should_receive(:find).with(:all).and_return([mock_match])
      get :index
      assigns[:matches].should == [mock_match]
    end

    describe "with mime type of xml" do
  
      it "should render all matches as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Match.should_receive(:find).with(:all).and_return(matches = mock("Array of Matches"))
        matches.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested match as @match" do
      Match.should_receive(:find).with("37").and_return(mock_match)
      get :show, :id => "37"
      assigns[:match].should equal(mock_match)
    end
    
    describe "with mime type of xml" do

      it "should render the requested match as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Match.should_receive(:find).with("37").and_return(mock_match)
        mock_match.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new match as @match" do
      Match.should_receive(:new).and_return(mock_match)
      get :new
      assigns[:match].should equal(mock_match)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested match as @match" do
      Match.should_receive(:find).with("37").and_return(mock_match)
      get :edit, :id => "37"
      assigns[:match].should equal(mock_match)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created match as @match" do
        Match.should_receive(:new).with({'these' => 'params'}).and_return(mock_match(:save => true))
        post :create, :match => {:these => 'params'}
        assigns(:match).should equal(mock_match)
      end

      it "should redirect to the created match" do
        Match.stub!(:new).and_return(mock_match(:save => true))
        post :create, :match => {}
        response.should redirect_to(match_url(mock_match))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved match as @match" do
        Match.stub!(:new).with({'these' => 'params'}).and_return(mock_match(:save => false))
        post :create, :match => {:these => 'params'}
        assigns(:match).should equal(mock_match)
      end

      it "should re-render the 'new' template" do
        Match.stub!(:new).and_return(mock_match(:save => false))
        post :create, :match => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested match" do
        Match.should_receive(:find).with("37").and_return(mock_match)
        mock_match.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :match => {:these => 'params'}
      end

      it "should expose the requested match as @match" do
        Match.stub!(:find).and_return(mock_match(:update_attributes => true))
        put :update, :id => "1"
        assigns(:match).should equal(mock_match)
      end

      it "should redirect to the match" do
        Match.stub!(:find).and_return(mock_match(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(match_url(mock_match))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested match" do
        Match.should_receive(:find).with("37").and_return(mock_match)
        mock_match.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :match => {:these => 'params'}
      end

      it "should expose the match as @match" do
        Match.stub!(:find).and_return(mock_match(:update_attributes => false))
        put :update, :id => "1"
        assigns(:match).should equal(mock_match)
      end

      it "should re-render the 'edit' template" do
        Match.stub!(:find).and_return(mock_match(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested match" do
      Match.should_receive(:find).with("37").and_return(mock_match)
      mock_match.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the matches list" do
      Match.stub!(:find).and_return(mock_match(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(matches_url)
    end

  end
  
  describe "responding to POST push" do

    it "should push the requested match" do
      Match.should_receive(:find).with("37").and_return(mock_match)
      mock_match.should_receive(:push).with("JSON")
      post :push, :id => "37", :payload => "JSON"
    end
  end
  
  describe "as an unauthorized user" do

    before(:each) do
      Match.stub!(:find).and_return(mock_match(:admin => stub_model(User)))
    end

    it "should redirect to matches index" do
      get :edit, :id => "1"
      response.should redirect_to(matches_url)
    end

  end

end
