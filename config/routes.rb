Launchpad::Application.routes.draw do

  resources :users
  
  root to: "static_pages#home"

  match '/fb', to: 'static_pages#fb'
end
