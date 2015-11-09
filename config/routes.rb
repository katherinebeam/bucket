Rails.application.routes.draw do
  get "/login" => "user_sessions#new", as: :login
  delete "/logout" => "user_sessions#destroy", as: :logout

  resources :users
  resources :user_sessions, only: [:new, :create]

  resources :bucket_lists do
    resources :bucketlist_items do
      member do
        patch :complete
      end
    end
  end
  root 'bucket_lists#index'

end
