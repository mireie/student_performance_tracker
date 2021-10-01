Rails.application.routes.draw do
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user
  devise_for :users
  resources :students do
    resources :progresses
    resources :benchmark_results
  end
  
  resources :teachers do
    resources :students
  end
  
  get "/inactive/teachers" => "teachers#inactive"
  get "/inactive/students" => "students#inactive"
  get "/charts" => "charts#index"
  get "/user-admin" => "users#index"
  post "/user-admin" => "users#toggle_active"

  root to: "landing#index"
end
