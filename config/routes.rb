Rails.application.routes.draw do
  get 'expenses/new'
  devise_for :users
  
  authenticated :user do
    root "categories#index", as: :authenticated_root
  end

  unauthenticated :user do
    root "splash#index", as: :unauthenticated_root
  end

  resources :users
  resources :categories, only: %i[index show new create destroy] do
    resources :expenses, only: %i[new create]
  end
end
