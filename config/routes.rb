Rails.application.routes.draw do
  devise_for :users
  root "locations#index"
  resources :locations, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :reviews, only: [:new, :create, :destroy]
    end
end
