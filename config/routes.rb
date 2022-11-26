Rails.application.routes.draw do
# 管理者用
# URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
    namespace :admin do
      get '/' => "users#index"
      get "search" => "searches#search_result"
      get "api_search" => "api_searches#search_result"
      post "api_book_create" => "api_searches#create"
      resources :users, only:[:index, :edit, :create, :update, :destroy]
      resources :books, only:[:new, :show, :index, :edit, :create, :update, :destroy]
      resources :categories, only:[:index, :edit, :create, :update, :destroy]
      resources :reviews, only:[:index, :destroy]
      resources :comments,only:[:index, :destroy]
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
      get "read_status/:book_id/update/:status", to: "read_status#update"
      get "book/:user_id/read" => "books#read"
      get "book/:user_id/reading" => "books#reading"
      get "book/:user_id/wish" => "books#wish"
      get "book/:user_id/reviews" => "books#reviews"
      get "book/review_rank/" => "books#reviews_rank", as: "book_reviews_rank"
      get "book/impressions_rank" => "books#impressions_rank"
      get "users/follower_rank" => "users#follower_rank"
      resources :users, only: [:show, :edit, :update, :update]do
        resource :relationships, only: [:create,:destroy]
        get :followings, on: :member
        get :followers, on: :member
      end
      
      resources:comments,only:[:create,:destroy]
      resources :books, only: [:index,:show,:edit,:create,:destroy,:update]do
        resources :reviews, only: [:create,:update,:destroy]do
          resource:favorites,only: [:create,:destroy]
        end
      end
    end
  
# ゲストログイン機能実装
    devise_scope :user do
      post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    end
  
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
