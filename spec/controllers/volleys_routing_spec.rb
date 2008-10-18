require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe VolleysController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "volleys", :action => "index").should == "/volleys"
    end
  
    it "should map #new" do
      route_for(:controller => "volleys", :action => "new").should == "/volleys/new"
    end
  
    it "should map #show" do
      route_for(:controller => "volleys", :action => "show", :id => 1).should == "/volleys/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "volleys", :action => "edit", :id => 1).should == "/volleys/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "volleys", :action => "update", :id => 1).should == "/volleys/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "volleys", :action => "destroy", :id => 1).should == "/volleys/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/volleys").should == {:controller => "volleys", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/volleys/new").should == {:controller => "volleys", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/volleys").should == {:controller => "volleys", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/volleys/1").should == {:controller => "volleys", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/volleys/1/edit").should == {:controller => "volleys", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/volleys/1").should == {:controller => "volleys", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/volleys/1").should == {:controller => "volleys", :action => "destroy", :id => "1"}
    end
  end
end
