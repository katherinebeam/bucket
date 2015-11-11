Rails.application.routes.draw do
  get 'welcome/index'

  get "/login" => "user_sessions#new", as: :login
  delete "/logout" => "user_sessions#destroy", as: :logout

  resources :users
  resources :user_sessions, only: [:new, :create]
  resources :password_resets, only: [:new, :create, :edit, :update]

  resources :bucket_lists do
    resources :post_attachments
    resources :bucketlist_items do
      member do
        patch :complete
      end
    end
  end
  root 'welcome#index'
  resources :posts
  post '/search' => 'bucket_lists#search'

end
