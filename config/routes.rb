ActionController::Routing::Routes.draw do |map|
  map.resources :commits
  map.resources :matches, :member => { "push" => :post }
  map.resources :players
  map.resources :users
  map.resources :volleys

  map.resource :session
  map.logout   "/logout", :controller => "sessions", :action => "destroy"
  map.login    "/login",  :controller => "sessions", :action => "new"

  map.root :controller => "matches"
end
