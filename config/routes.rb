Rails.application.routes.draw do
  devise_for :users

  root "locations#index"

  resources :locations, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :reviews, only: [:new, :create, :destroy, :edit, :update]
    resources :location_images, only: [:create, :destroy]
  end

  namespace :admin do
    resources :users, only: [:index]
    resources :locations, only: [:update]
  end
end
