require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AvatarsController do

  def mock_avatar(stubs={})
    @mock_avatar ||= mock_model(Avatar, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all avatars as @avatars" do
      Avatar.should_receive(:find).with(:all).and_return([mock_avatar])
      get :index
      assigns[:avatars].should == [mock_avatar]
    end

    describe "with mime type of xml" do
  
      it "should render all avatars as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Avatar.should_receive(:find).with(:all).and_return(avatars = mock("Array of Avatars"))
        avatars.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested avatar as @avatar" do
      Avatar.should_receive(:find).with("37").and_return(mock_avatar)
      get :show, :id => "37"
      assigns[:avatar].should equal(mock_avatar)
    end
    
    describe "with mime type of xml" do

      it "should render the requested avatar as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Avatar.should_receive(:find).with("37").and_return(mock_avatar)
        mock_avatar.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new avatar as @avatar" do
      Avatar.should_receive(:new).and_return(mock_avatar)
      get :new
      assigns[:avatar].should equal(mock_avatar)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested avatar as @avatar" do
      Avatar.should_receive(:find).with("37").and_return(mock_avatar)
      get :edit, :id => "37"
      assigns[:avatar].should equal(mock_avatar)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created avatar as @avatar" do
        Avatar.should_receive(:new).with({'these' => 'params'}).and_return(mock_avatar(:save => true))
        post :create, :avatar => {:these => 'params'}
        assigns(:avatar).should equal(mock_avatar)
      end

      it "should redirect to the created avatar" do
        Avatar.stub!(:new).and_return(mock_avatar(:save => true))
        post :create, :avatar => {}
        response.should redirect_to(avatar_url(mock_avatar))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved avatar as @avatar" do
        Avatar.stub!(:new).with({'these' => 'params'}).and_return(mock_avatar(:save => false))
        post :create, :avatar => {:these => 'params'}
        assigns(:avatar).should equal(mock_avatar)
      end

      it "should re-render the 'new' template" do
        Avatar.stub!(:new).and_return(mock_avatar(:save => false))
        post :create, :avatar => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested avatar" do
        Avatar.should_receive(:find).with("37").and_return(mock_avatar)
        mock_avatar.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :avatar => {:these => 'params'}
      end

      it "should expose the requested avatar as @avatar" do
        Avatar.stub!(:find).and_return(mock_avatar(:update_attributes => true))
        put :update, :id => "1"
        assigns(:avatar).should equal(mock_avatar)
      end

      it "should redirect to the avatar" do
        Avatar.stub!(:find).and_return(mock_avatar(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(avatar_url(mock_avatar))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested avatar" do
        Avatar.should_receive(:find).with("37").and_return(mock_avatar)
        mock_avatar.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :avatar => {:these => 'params'}
      end

      it "should expose the avatar as @avatar" do
        Avatar.stub!(:find).and_return(mock_avatar(:update_attributes => false))
        put :update, :id => "1"
        assigns(:avatar).should equal(mock_avatar)
      end

      it "should re-render the 'edit' template" do
        Avatar.stub!(:find).and_return(mock_avatar(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested avatar" do
      Avatar.should_receive(:find).with("37").and_return(mock_avatar)
      mock_avatar.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the avatars list" do
      Avatar.stub!(:find).and_return(mock_avatar(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(avatars_url)
    end

  end

end
