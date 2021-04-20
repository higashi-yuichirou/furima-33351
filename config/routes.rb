Rails.application.routes.draw do
  devise_for :users
  root to: "lists#index"
  resources :lists do
    get "purchase/index"
    root "purchases#index"
    resources :purchases
  end

end
