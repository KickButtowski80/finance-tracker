Rails.application.routes.draw do
 
  devise_for :users 
  root to: 'welcome#index'
  get 'my_portfolio', to: "users#my_portfolio"  
  get 'search_stocks', to: "stocks#search"
  get 'my_friends', to: "users#my_friends"
  post 'add_friend', to: "users#add_friend"
   
   
  resources :user_stocks, only: [:create, :destroy]
  resources :users , only: [:show, :destroy]
  resources :notes , only: [:new,:create,:index]
  get 'search-friends' , to: 'users#search'
  
end
