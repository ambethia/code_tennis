require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe VolleysController do

  def mock_volley(stubs={})
    @mock_volley ||= mock_model(Volley, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all volleys as @volleys" do
      Volley.should_receive(:find).with(:all).and_return([mock_volley])
      get :index
      assigns[:volleys].should == [mock_volley]
    end

    describe "with mime type of xml" do
  
      it "should render all volleys as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Volley.should_receive(:find).with(:all).and_return(volleys = mock("Array of Volleys"))
        volleys.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested volley as @volley" do
      Volley.should_receive(:find).with("37").and_return(mock_volley)
      get :show, :id => "37"
      assigns[:volley].should equal(mock_volley)
    end
    
    describe "with mime type of xml" do

      it "should render the requested volley as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Volley.should_receive(:find).with("37").and_return(mock_volley)
        mock_volley.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new volley as @volley" do
      Volley.should_receive(:new).and_return(mock_volley)
      get :new
      assigns[:volley].should equal(mock_volley)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested volley as @volley" do
      Volley.should_receive(:find).with("37").and_return(mock_volley)
      get :edit, :id => "37"
      assigns[:volley].should equal(mock_volley)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created volley as @volley" do
        Volley.should_receive(:new).with({'these' => 'params'}).and_return(mock_volley(:save => true))
        post :create, :volley => {:these => 'params'}
        assigns(:volley).should equal(mock_volley)
      end

      it "should redirect to the created volley" do
        Volley.stub!(:new).and_return(mock_volley(:save => true))
        post :create, :volley => {}
        response.should redirect_to(volley_url(mock_volley))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved volley as @volley" do
        Volley.stub!(:new).with({'these' => 'params'}).and_return(mock_volley(:save => false))
        post :create, :volley => {:these => 'params'}
        assigns(:volley).should equal(mock_volley)
      end

      it "should re-render the 'new' template" do
        Volley.stub!(:new).and_return(mock_volley(:save => false))
        post :create, :volley => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested volley" do
        Volley.should_receive(:find).with("37").and_return(mock_volley)
        mock_volley.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :volley => {:these => 'params'}
      end

      it "should expose the requested volley as @volley" do
        Volley.stub!(:find).and_return(mock_volley(:update_attributes => true))
        put :update, :id => "1"
        assigns(:volley).should equal(mock_volley)
      end

      it "should redirect to the volley" do
        Volley.stub!(:find).and_return(mock_volley(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(volley_url(mock_volley))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested volley" do
        Volley.should_receive(:find).with("37").and_return(mock_volley)
        mock_volley.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :volley => {:these => 'params'}
      end

      it "should expose the volley as @volley" do
        Volley.stub!(:find).and_return(mock_volley(:update_attributes => false))
        put :update, :id => "1"
        assigns(:volley).should equal(mock_volley)
      end

      it "should re-render the 'edit' template" do
        Volley.stub!(:find).and_return(mock_volley(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested volley" do
      Volley.should_receive(:find).with("37").and_return(mock_volley)
      mock_volley.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the volleys list" do
      Volley.stub!(:find).and_return(mock_volley(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(volleys_url)
    end

  end

end
