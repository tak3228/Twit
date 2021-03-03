Rails.application.routes.draw do
  # /で表示されるルートパス
  root 'home#index'

  get 'tweets/index'
  get 'tweets/show'
  get 'tweets/new'
  post "tweets" => "tweets#create"

  # devise
  # deviseで追加したカラムを更新出来るようにするために新たに定義したコントローラーを参照
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  # resourcesは7つのルーティングを自動生成する
  resources :users, only: [:index, :show]
  resources :relationships, only: %i[create destroy]
end

# postはdbを変更する際に使用する。それ以外はgetを使用
