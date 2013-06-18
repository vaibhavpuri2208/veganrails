HackJsonSupport::Application.routes.draw do
  
  resources :users

  resources :places

  resources :reviews

  resources :pictures

  resources :cuisines

  resources :categories

  resources :cities


  # Delete after ready
  resources :hackathons
end
