Launchpad::Application.routes.draw do
  resources :users

  get "github/index"
  get "github/resp"

  get "linkedin/index"
  get "linkedin/resp"

  get "facebook/index"
  get "facebook/resp"

  get "dev/userCallback"
  
  root to: "static_pages#home"

  match '/fb', to: 'static_pages#fb'

  match '/tw', to: 'static_pages#tw'
end
