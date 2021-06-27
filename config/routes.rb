Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  root to: 'articles#index'
  resources :items, only: [:index, :new, :create, :articles ] do
  end
end
