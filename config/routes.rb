Rails.application.routes.draw do

  # ユーザー用
  # URL /users/sign_in ...
  get "/users/get_store" => "public/registration_jsons#get_store"
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions',
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions",
  }

  # 共通ページ
  root 'homes#top'
  get 'homes/about' => 'homes#about'
  get 'homes/question' => 'homes#question'

  # ゲストログイン用
  post '/public/guests', to: 'public/guest_sessions#create'

  # 管理者
  namespace :admin do
    get 'homes/top' => 'homes#top'
    resources :users, only: [:index, :show, :edit, :update, :destroy] do
      collection do
        get 'search'
      end
    end
    resources :items, only: [:index, :show] do
      member do
        get :user_index
      end
      resources :comments, only: [:destroy]
    end
    resources :brands, only: [:index, :show, :create, :destroy]
    resources :stores, only: [:index, :create, :destroy]
  end

  # ユーザー（顧客・店舗スタッフ）
  namespace :public do
    resources :users, only: [:show, :edit, :update] do
      get :favorites, on: :collection
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' =>  'relationships#followers', as: 'followers'
    end

    get 'items/my_item' => 'items#my_item'
    get 'items/privacy' => 'items#privacy'
    get 'items/clerk' => 'items#clerk'

    resources :items, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
      collection do
        get 'search'
      end
      resources :comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end

    resources :messages, only: [:create]
    resources :rooms, only: [:create, :index, :show]
    resources :brands, only: [] do
      resources :stores, only: [:index]
    end
    resources :contacts, only: [:create, :new, :check]
    resources :notifications, only: [:index]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
