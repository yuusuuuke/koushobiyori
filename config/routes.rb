Rails.application.routes.draw do
# 管理者用
# URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
    namespace :admin do
      get '/' =>'homes#top'
      get "search" => "searches#search"
      resources :users, only:[:index, :edit, :create, :update, :destroy]
      resources :books, only:[:show, :edit, :create, :update, :destroy]
      resources :categories, only:[:index, :edit, :create, :update, :destroy]
      resources :reviews, only:[:destroy]
      resources :post_comments,only:[:destroy]
    end
  
# ユーザ用
# URL /users/sign_in ...
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
    scope module: :public do
      root to:"homes#top"
      get '/about' => 'homes#about', as: "about"
      get "users/confirm"
      patch 'users/withdraw'
      get "search" => "searches#search_result"
      get "api_search" => "api_searches#search_result"
      post "api_book_create" => "api_searches#create"
      resources :users, only: [:show, :edit, :update, :update]do
        resource :relationships, only: [:create,:destroy]
        get :followings, on: :member
        get :followers, on: :member
      end
      
      
      resources :books, only: [:index,:show,:edit,:create,:destroy,:update]do
        resources :reviews, only: [:edit,:create,:update,:destroy]do
          resource:favorites,only: [:create,:destroy]
          resources:post_comments,only:[:create,:destroy]
        end
      end
    end
  
# ゲストログイン機能実装
    devise_scope :user do
      post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    end
  
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
