ActionController::Routing::Routes.draw do |map|
  map.resources :volleys

  map.logout   "/logout",   :controller => "sessions", :action => "destroy"
  map.login    "/login",    :controller => "sessions", :action => "new"

  map.resources :users
  map.resources :matches

  map.resource :session

  map.root :controller => "matches"
end
