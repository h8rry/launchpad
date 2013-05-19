Launchpad::Application.routes.draw do
  get "linkedin/resp"

  resources :users

  get "dev/resp"

  get "github/index" #redirect
  get "github/resp"

  get "linkedin/index" #redirect
  get "linkedin/resp"

  get "dev/facebook" #redirect
  get "dev/user"

  get "dev/userCallback"
  
  root to: "static_pages#home"

  match '/fb', to: 'static_pages#fb'
  
end
