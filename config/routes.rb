SampleApp::Application.routes.draw do
  
  default_url_options :host => "https://hallit.herokuapp.com"
  get 'users/autocomplete_user_username'
    resources :users
   resources :invitations

   resources :microposts, :path => 'hall' do
    resources :likes
   end

  resources :likes

  resources :microposts, :path => 'hall' do
    resources :comments
   end

  resources :comments
  
  resources :microposts, :path => 'hall' do
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
  resources :microposts, only: [:create, :destroy, :show]
  resources :relationships, only: [:create, :destroy]
  root to: 'static_pages#welcome'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/privacy',    to: 'static_pages#privacy',    via: 'get'
  match '/about',    to: 'static_pages#about',    via: 'get'
  match '/support', to: 'static_pages#support', via: 'get'
  match '/youth',    to: 'static_pages#youth',    via: 'get'
  match '/terms', to: 'static_pages#terms', via: 'get' 
  match '/guide', to: 'static_pages#guide', via: 'get' 
  match '/createhall', to: 'static_pages#createhall', via: 'get'
  match '/welcome', to: 'static_pages#welcome', via: 'get'
  match '/search', to: 'static_pages#search', via: 'get'
  match '/home', to: 'static_pages#home', via: 'get'
  match '/halls', to: 'microposts#index', via: 'get'
  match '/leaderboard', to: 'microposts#leaderboard', via: 'get'
  match '/new/hall', to: 'microposts#new', via: 'get'
end
