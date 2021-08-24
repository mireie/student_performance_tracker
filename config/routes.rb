Rails.application.routes.draw do
  devise_for :users
  resources :students do
    resources :progresses
    resources :benchmark_results
  end

  resources :teachers do
    resources :students
  end

  get '/charts' => 'charts#index'

  root to:"students#index"
end
