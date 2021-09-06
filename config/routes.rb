Rails.application.routes.draw do
  root to: "items#index" 
  devise_for :users

  resources :items do
    resources :orders, only: [:index, :create]
    resources :comments, only: [:create]
  end

end
