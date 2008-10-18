require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CommitsController do

  def mock_commit(stubs={})
    @mock_commit ||= mock_model(Commit, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all commits as @commits" do
      Commit.should_receive(:find).with(:all).and_return([mock_commit])
      get :index
      assigns[:commits].should == [mock_commit]
    end

    describe "with mime type of xml" do
  
      it "should render all commits as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Commit.should_receive(:find).with(:all).and_return(commits = mock("Array of Commits"))
        commits.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested commit as @commit" do
      Commit.should_receive(:find).with("37").and_return(mock_commit)
      get :show, :id => "37"
      assigns[:commit].should equal(mock_commit)
    end
    
    describe "with mime type of xml" do

      it "should render the requested commit as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Commit.should_receive(:find).with("37").and_return(mock_commit)
        mock_commit.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new commit as @commit" do
      Commit.should_receive(:new).and_return(mock_commit)
      get :new
      assigns[:commit].should equal(mock_commit)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested commit as @commit" do
      Commit.should_receive(:find).with("37").and_return(mock_commit)
      get :edit, :id => "37"
      assigns[:commit].should equal(mock_commit)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created commit as @commit" do
        Commit.should_receive(:new).with({'these' => 'params'}).and_return(mock_commit(:save => true))
        post :create, :commit => {:these => 'params'}
        assigns(:commit).should equal(mock_commit)
      end

      it "should redirect to the created commit" do
        Commit.stub!(:new).and_return(mock_commit(:save => true))
        post :create, :commit => {}
        response.should redirect_to(commit_url(mock_commit))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved commit as @commit" do
        Commit.stub!(:new).with({'these' => 'params'}).and_return(mock_commit(:save => false))
        post :create, :commit => {:these => 'params'}
        assigns(:commit).should equal(mock_commit)
      end

      it "should re-render the 'new' template" do
        Commit.stub!(:new).and_return(mock_commit(:save => false))
        post :create, :commit => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested commit" do
        Commit.should_receive(:find).with("37").and_return(mock_commit)
        mock_commit.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :commit => {:these => 'params'}
      end

      it "should expose the requested commit as @commit" do
        Commit.stub!(:find).and_return(mock_commit(:update_attributes => true))
        put :update, :id => "1"
        assigns(:commit).should equal(mock_commit)
      end

      it "should redirect to the commit" do
        Commit.stub!(:find).and_return(mock_commit(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(commit_url(mock_commit))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested commit" do
        Commit.should_receive(:find).with("37").and_return(mock_commit)
        mock_commit.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :commit => {:these => 'params'}
      end

      it "should expose the commit as @commit" do
        Commit.stub!(:find).and_return(mock_commit(:update_attributes => false))
        put :update, :id => "1"
        assigns(:commit).should equal(mock_commit)
      end

      it "should re-render the 'edit' template" do
        Commit.stub!(:find).and_return(mock_commit(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested commit" do
      Commit.should_receive(:find).with("37").and_return(mock_commit)
      mock_commit.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the commits list" do
      Commit.stub!(:find).and_return(mock_commit(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(commits_url)
    end

  end

end
