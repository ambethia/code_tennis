require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe MatchesController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "matches", :action => "index").should == "/matches"
    end
  
    it "should map #new" do
      route_for(:controller => "matches", :action => "new").should == "/matches/new"
    end
  
    it "should map #show" do
      route_for(:controller => "matches", :action => "show", :id => 1).should == "/matches/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "matches", :action => "edit", :id => 1).should == "/matches/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "matches", :action => "update", :id => 1).should == "/matches/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "matches", :action => "destroy", :id => 1).should == "/matches/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/matches").should == {:controller => "matches", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/matches/new").should == {:controller => "matches", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/matches").should == {:controller => "matches", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/matches/1").should == {:controller => "matches", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/matches/1/edit").should == {:controller => "matches", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/matches/1").should == {:controller => "matches", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/matches/1").should == {:controller => "matches", :action => "destroy", :id => "1"}
    end
  end
end
