Rails.application.routes.draw do


# ユーザー用
# URL /users/sign_in ...
devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
#管理者用
devise_for :admin,skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

#共通トップページ
root 'homes#top'


#管理者
namespace :admin do
  resources :users, only: [:index, :show, :edit]
  resources :brands, only: [:index, :create, :destroy]
  resources :stores, only: [:index, :create]

  end

#ユーザー（顧客・店舗スタッフ）
 namespace :public do
   resources :users, only: [:show] do
     resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' =>  'relationships#followers', as: 'followers'
    end

   get 'items/privacy' => 'items#privacy'
   get 'items/clerk' => 'items#clerk'
   
   resources :items, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
     resources :comments, only: [:create, :destroy]
     resource :favorites, only: [:create, :destroy]
   end



  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
