Rails.application.routes.draw do

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
    root to: "homes#top"
  end

  scope module: :public do
    root to: "homes#top"
    resources :users, only: [:show, :edit, :update, :destroy] do
      member do
        get :follows, :followers
      end
        resource :relationships, only: [:create, :destroy]
    end
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resource :favorites, only: [:create, :destroy]
    end
  end

end
