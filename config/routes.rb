Rails.application.routes.draw do
  get 'listings/new', to: 'listings#new'
  get 'bookings/new', to: 'bookings#new'
  get 'users/:id/booking', to: 'users#showbooking'
  get 'bookings/home', to: 'bookings#home'
  post 'listings/new', to: 'listings#create'
  post 'bookings/new', to: 'bookings#create'
  get 'sessions/new', to: 'sessions#new'
  get '/home', to: 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  root 'static_pages#home'
  resources :pictures
  resources :users
  resources :listings, only: [:create, :destroy]
  resources :bookings, only: [:create, :destroy]
end


