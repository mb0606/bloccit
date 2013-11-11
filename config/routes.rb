Bloccit::Application.routes.draw do
  
  
  get "posts/index"

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }

  resources :users, only: [:show, :index] # create a route for users#show
  resources :posts, only: [:index]
  resources :topics do
    resources :posts, except: [:index], controller: 'topics/posts' do
      resources :comments, only: [:create,:destroy]
      match '/up-vote', to: 'votes#up_vote', as: :up_vote
      match '/down-vote', to: 'votes#down_vote', as: :down_vote
      resources :favorites, only: [:create, :destroy]
    end
  end

#Nested routes ***********************
#show posts that are associated with topics : /topics/1/posts/3 
#  get "topics/index"
#  get "topics/new"
#  get "topics/show"
#  get "topics/edit"
#  get "posts/index"
#  get "posts/show"
#  get "posts/new"
#  get "posts/edit"
#  get "welcome/index"
#  get "welcome/about"

  

  match "about" => 'welcome#about', via: :get

  root to: 'welcome#index'
end
