Launchpad::Application.routes.draw do
  resources :users

  get "dev/resp"

  get "github/index"
  get "github/resp"
  
  # Redirect only
  get "dev/facebook"
  get "dev/twitter"
  get "dev/google"
  
  get "dev/user"
  get "dev/userCallback"
  
  root to: "static_pages#home"

  match '/fb', to: 'static_pages#fb'
  
end
