ActionController::Routing::Routes.draw do |map|
  map.resources :matches, :member => {
    "push"     => :post,
    "volley"   => :put,
    "complete" => :put
  }

  map.resource :session
  map.logout   "/logout", :controller => "sessions", :action => "destroy"
  map.login    "/login",  :controller => "sessions", :action => "new"

  # A hybrid singular/plural resource.
  map.with_options :controller => "users" do |map|
    map.current_user "/user", :action => "edit",    :conditions => { :method => :get }
    map.current_user "/user", :action => "destroy", :conditions => { :method => :delete }
    map.current_user "/user", :action => "update",  :conditions => { :method => :put }

    map.users "/users",     :action   => "index"
    map.user  "/users/:id", :action   => "show"
  end
  
  map.root :controller => "matches", :action => "index"
end
