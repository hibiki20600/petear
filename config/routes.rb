Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :toppages do
    collection do
      get "search"
      get "search1"
      get "search2"
    end
  end
    root to: "toppages#index"
  resources :groups, only: [:new, :create, :edit, :update, :show, :destroy] do
    member do
      get 'album'
    end
    resources :messages, only: [:index, :create] do
      get 'goods/toggle'
    end
  end
  resources :users, only: [:index, :edit, :update, :show]
  resources :group_followers, only: [:create, :destroy]
  resources :group_users, only: [:create, :destroy]
  resources :goods, only: [:create, :destroy]
  resources :u_tags, except: [:index, :show]
  resources :u_tag_groups
  resources :friends, only: [:create, :destroy]
  resources :freriqus, only: [:create, :destroy]
end
