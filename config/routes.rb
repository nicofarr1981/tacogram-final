Rails.application.routes.draw do
  get "/", :controller => "posts", :action => "index"
  get "/login", :controller => "sessions", :action => "new"
  get "/logout", :controller => "sessions", :action => "destroy"
  get "/delete", :controller => "posts", :action => "destroy"
  get "/edit", :controller => "posts", :action => "update"

  resources "posts"
  resources "sessions"
  resources "users"
end
