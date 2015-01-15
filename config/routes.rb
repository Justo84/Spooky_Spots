Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  root "locations#index"
  resources :locations, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :reviews, only: [:new, :create, :destroy, :edit, :update]
    resources :location_images, only: [:create]
    end


    namespace :admin do
      resources :users, only: [:index]
    end
end
