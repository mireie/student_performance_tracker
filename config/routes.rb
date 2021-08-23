Rails.application.routes.draw do
  devise_for :users
  resources :students do
    resources :dibels_results
    resources :quarterly_results
  end
  root to:"students#index"
end
