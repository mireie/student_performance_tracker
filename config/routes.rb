Rails.application.routes.draw do
  devise_for :users
  resources :students do
    resources :progresses
    resources :benchmarks
  end

  resources :teachers do
    resources :students
  end

  root to:"students#index"
end
