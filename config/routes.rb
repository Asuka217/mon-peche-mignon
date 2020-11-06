Rails.application.routes.draw do
  devise_for :users
  root to: "trainings#index"

  resources :trainings, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :users, only: [:show]

end
