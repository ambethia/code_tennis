require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UsersController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "users", :action => "index").should == "/users"
    end

    it "should map #show" do
      route_for(:controller => "users", :action => "show", :id => 1).should == "/users/1"
    end

    it "should map #edit" do
      route_for(:controller => "users", :action => "edit").should == "/user"
    end

    it "should map #update" do
      route_for(:controller => "users", :action => "update").should == "/user"
    end
  
    it "should map #destroy" do
      route_for(:controller => "users", :action => "destroy").should == "/user"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/users").should == {:controller => "users", :action => "index"}
    end

    it "should generate params for #show" do
      params_from(:get, "/users/1").should == {:controller => "users", :action => "show", :id => "1"}
    end

    it "should generate params for #edit" do
      params_from(:get, "/user").should == {:controller => "users", :action => "edit"}
    end

    it "should generate params for #update" do
      params_from(:put, "/user").should == {:controller => "users", :action => "update"}
    end

    it "should generate params for #destroy" do
      params_from(:delete, "/user").should == {:controller => "users", :action => "destroy"}
    end
  end
end
