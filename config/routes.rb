Launchpad::Application.routes.draw do

  resources :users

  get "dev/index"
  
  get "dev/resp"
 
  root to: "static_pages#home"

  match '/fb', to: 'static_pages#fb'
  
end
