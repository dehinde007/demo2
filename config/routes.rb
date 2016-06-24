SampleApp::Application.routes.draw do
  
  default_url_options :host => "www.hallit.co"
    resources :users
   resources :invitations

   resources :microposts do
    resources :likes
   end
  
  resources :likes

  resources :microposts do
    resources :comments
   end

  resources :comments
  
  resources :microposts do
    resources :trends
   end
  
  resources :trends

  resources :users do
    member do
      get :following, :followers
      get :ver, :verify
    end
  end
  resources :activities
  resources :sessions,      only: [:new, :create, :destroy]
  resources :microposts,    only: [:create, :destroy, :show]
  resources :relationships, only: [:create, :destroy]
  root to: 'static_pages#welcome'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/support',    to: 'static_pages#support',    via: 'get'
  match '/jobs',    to: 'static_pages#jobs',    via: 'get'
  match '/vision',    to: 'static_pages#vision',    via: 'get'
  match '/terms',   to: 'static_pages#terms',   via: 'get'
  match '/privacy', to: 'static_pages#privacy', via: 'get'
  match '/getstarted', to: 'static_pages#getstarted', via: 'get'
  match '/howtomakeahall', to: 'static_pages#howtomakeahall', via: 'get'
  match '/welcome', to: 'static_pages#welcome', via: 'get'
  match '/search', to: 'static_pages#search', via: 'get'
  match '/make_hall', to: 'static_pages#make_hall', via: 'get'
  match '/home', to: 'static_pages#home', via: 'get'
  match '/halls', to: 'microposts#index', via: 'get'
  match '/new/hall', to: 'microposts#new', via: 'get'
end
