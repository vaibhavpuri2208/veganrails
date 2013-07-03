HackJsonSupport::Application.routes.draw do
  
  get '/register', :controller => 'users', :action => 'new', as: 'register' 
  post '/sessions', :controller =>'sessions', :action=>'create'
  resources :users

  resources :places

  resources :reviews

  resources :pictures

  resources :cuisines

  resources :categories

  resources :cities
  
  resources :sessions

  root :to => 'static#start'
  
  get '/login', :controller => 'static', :action => 'login', as: 'login' 

  get '/search/new', :controller=>'search', :action =>'new', as: 'search'


  get '/search/find', :controller=>'search', :action=>'find'
  # Delete after ready
  resources :hackathons
end
