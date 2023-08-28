Rails.application.routes.draw do

  namespace :admin do
    get 'posts/index'
    get 'posts/show'
  end
  # 顧客用
# URL /users/sign_in ...
devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}


  namespace :admin do
    resources :users, only: [:index, :show, :destroy]
    resources :posts, only: [:index, :show, :destroy]
  end

  scope module: :public do
    root to: "homes#top"
    resources :users, only: [:show, :edit, :update, :destroy] do
      collection do
        # 退会確認画面
        get  '/users/check' => 'users#check'
      end
      member do
        get :follows, :followers
      end
        resource :relationships, only: [:create, :destroy]
    end
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :post_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
  end

end
