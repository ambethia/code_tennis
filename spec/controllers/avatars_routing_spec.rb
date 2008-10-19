require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AvatarsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "avatars", :action => "index").should == "/avatars"
    end
  
    it "should map #new" do
      route_for(:controller => "avatars", :action => "new").should == "/avatars/new"
    end
  
    it "should map #show" do
      route_for(:controller => "avatars", :action => "show", :id => 1).should == "/avatars/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "avatars", :action => "edit", :id => 1).should == "/avatars/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "avatars", :action => "update", :id => 1).should == "/avatars/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "avatars", :action => "destroy", :id => 1).should == "/avatars/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/avatars").should == {:controller => "avatars", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/avatars/new").should == {:controller => "avatars", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/avatars").should == {:controller => "avatars", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/avatars/1").should == {:controller => "avatars", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/avatars/1/edit").should == {:controller => "avatars", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/avatars/1").should == {:controller => "avatars", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/avatars/1").should == {:controller => "avatars", :action => "destroy", :id => "1"}
    end
  end
end
