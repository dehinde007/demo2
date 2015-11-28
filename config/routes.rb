SampleApp::Application.routes.draw do
  
  default_url_options :host => "www.hallit.co"
  
   resources :invitations

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
  resources :activities
  resources :sessions,      only: [:new, :create, :destroy]
  resources :microposts,    only: [:create, :destroy, :show]
  resources :relationships, only: [:create, :destroy]
  root to: 'static_pages#welcome'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/contact_us',    to: 'static_pages#contact_us',    via: 'get'
  match '/jobs',    to: 'static_pages#jobs',    via: 'get'
  match '/about_us',    to: 'static_pages#about_us',    via: 'get'
  match '/terms',   to: 'static_pages#terms',   via: 'get'
  match '/privacy', to: 'static_pages#privacy', via: 'get'
  match '/help', to: 'static_pages#help', via: 'get'
  match '/imgkit', to: 'static_pages#imgkit', via: 'get'
  match '/welcome', to: 'static_pages#welcome', via: 'get'
  match '/make_hall', to: 'static_pages#make_hall', via: 'get'
  match '/home', to: 'static_pages#home', via: 'get'
end
