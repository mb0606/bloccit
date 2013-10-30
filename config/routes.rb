Bloccit::Application.routes.draw do
  
  
  devise_for :users

  resources :topics do
    resources :posts, except: [:index] do
      resources :comments, only: [:create,:destroy]
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
