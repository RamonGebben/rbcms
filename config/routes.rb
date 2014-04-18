Cms::Application.routes.draw do
  resources :pageviews
    
    get "post/:id" => "frontend#post"
    get "log_out" => "sessions#destroy", :as => "log_out"
    get "admin" => "sessions#new", :as => "log_in"

    scope 'admin' do     
      resources :users
      resources :posts
      resources :users
      get "pages" => "posts#pages", :as => "pages"
    end
    resources :sessions  

    get ":name" => "frontend#page"
    get ":name/edit" => "posts#page"
    root :to => "frontend#home"
end
