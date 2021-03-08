Rails.application.routes.draw do
  get 'like/create'
  get 'like/destroy'
  # /で表示されるルートパス
  root 'home#index'

  # tweetごとにcommentとlikeのルートを作成する
  resources :tweets, only: %i[index new create show destroy] do
    resources :comments, only: %i[create destroy]
    resources :likes, only: %i[create destroy]
    resources :retweets, only: %i[create destroy]
  end

  # devise
  # deviseで追加したカラムを更新出来るようにするために新たに定義したコントローラーを参照
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  # resourcesは7つのルーティングを自動生成する
  resources :users, only: %i[index show]
  resources :relationships, only: %i[create destroy]
end

# postはdbを変更する際に使用する。それ以外はgetを使用
