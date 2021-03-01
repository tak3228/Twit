Rails.application.routes.draw do
  # /で表示されるルートパス
  root 'home#index'

  get 'tweets/index'
  get 'tweets/show'
  get 'tweets/new'
  post "tweets" => "tweets#create"

  get 'users/index'
  get "users/show/:id" => "users#show"

  # devise
  devise_for :users
end

# postはdbを変更する際に使用する。それ以外はgetを使用
