Rails.application.routes.draw do
  resources :users, only: [:show, :edit, :update]
  # get 'users/show'
  # get 'users/edit'
  # ↓はコメントが画像と結びついているので入れ子関係になる
  resources :post_images, only: [:new, :index, :show, :create, :destroy] do
    resources :post_comments, only: [:create, :destroy]
  end
  devise_for :users
  root to: "homes#top"
  get '/homes/about', to:'homes#about', as: "about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
