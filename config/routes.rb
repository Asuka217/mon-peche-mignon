Rails.application.routes.draw do
  devise_for :users
  root to: "trainings#index"

  resources :trainings, only: :index

end
