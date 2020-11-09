Rails.application.routes.draw do
  devise_for :users
  root to: "trainings#index"

  resources :trainings, only: [:index, :new, :create, :edit, :update, :destroy] do
    resources :achievements, only: [:new, :create]
  end

  resources :users, only: :show

end
