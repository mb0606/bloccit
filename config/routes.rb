Bloccit::Application.routes.draw do
  devise_for :users

#  get "posts/index"
#  get "posts/show"
#  get "posts/new"
#  get "posts/edit"
#  get "welcome/index"
#  get "welcome/about"

resources :posts

match "about" => 'welcome#about', via: :get

  root to: 'welcome#index'
end
