Rails.application.routes.draw do
  devise_for :users
  
  authenticated :user do
    root "category#index", as: :authenticated_root
  end

  unauthenticated :user do
    root "splash#index", as: :unauthenticated_root
  end

  resources :users
end
