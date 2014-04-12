Cms::Application.routes.draw do
  resources :pageviews
    
    get "frontend/home"
    get "/post/:id" => "frontend#post"
    get "log_out" => "sessions#destroy", :as => "log_out"
    get "admin" => "sessions#new", :as => "log_in"
    root :to => "frontend#home"
    resources :users
    resources :posts
    resources :users
    resources :sessions
end
