Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'lists#index'

  resources :lists do
    resources :tasks, only: [:new, :create, :update, :destroy]

  end
end
