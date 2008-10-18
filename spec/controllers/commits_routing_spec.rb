require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CommitsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "commits", :action => "index").should == "/commits"
    end
  
    it "should map #new" do
      route_for(:controller => "commits", :action => "new").should == "/commits/new"
    end
  
    it "should map #show" do
      route_for(:controller => "commits", :action => "show", :id => 1).should == "/commits/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "commits", :action => "edit", :id => 1).should == "/commits/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "commits", :action => "update", :id => 1).should == "/commits/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "commits", :action => "destroy", :id => 1).should == "/commits/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/commits").should == {:controller => "commits", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/commits/new").should == {:controller => "commits", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/commits").should == {:controller => "commits", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/commits/1").should == {:controller => "commits", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/commits/1/edit").should == {:controller => "commits", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/commits/1").should == {:controller => "commits", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/commits/1").should == {:controller => "commits", :action => "destroy", :id => "1"}
    end
  end
end
