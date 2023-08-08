Rails.application.routes.draw do
  devise_for :users
  
  authenticated :user do
    root to "category#index", as: :authenticated_root
  end

  unauthenticated :user do
    root to "splash#index", as: :unauthenticated_root
  end

  resources :users
end
