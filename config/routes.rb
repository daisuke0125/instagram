Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' } 
  
  # # topページ
  # root 'posts#index'
  # # マイページ  [as: でパス名を付けれる]
  # get 'users/:id' => 'users#show', as: "user"
  # # 投稿作成ページ
  # get 'posts/new' => 'posts#new'
  # # 投稿一覧ページ
  # get 'posts' => 'posts#index'
  # # 投稿作成
  # post 'posts' => 'posts#create'
  # # 投稿の写真を保存
  # post 'posts/:post_id/photos' => 'photos#create', as: 'post_photos'
  
  root 'posts#index'
  get '/users/:id' => 'users#show', as: 'user'
  resources :posts, only: [:index, :new, :create, :show, :destroy] do
    resources :photos, only: [:create]
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
end



# 参考記事：パスワード入力なしでプロフィール編集できるようにする
# https://github.com/plataformatec/devise/wiki/How-To:-Allow-users-to-edit-their-account-without-providing-a-password