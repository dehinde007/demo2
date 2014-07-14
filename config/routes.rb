SampleApp::Application.routes.draw do
  
   resources :microposts do
    resources :likes
   end
  
  resources :likes

  resources :microposts do
    resources :comments
   end
  
  
  resources :comments

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :sessions,      only: [:new, :create, :destroy]
  resources :microposts,    only: [:create, :destroy, :show]
  resources :relationships, only: [:create, :destroy]
  root to: 'static_pages#welcome'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/terms',   to: 'static_pages#terms',   via: 'get'
  match '/privacy', to: 'static_pages#privacy', via: 'get'
  match '/welcome', to: 'static_pages#welcome', via: 'get'
  match '/home', to: 'feeds#home', via: 'get'
end
