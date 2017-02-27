Rails.application.routes.draw do
  devise_for :users
  devise_for :admins

  namespace :admin do
    authenticated :admin do
      root to: "dashboard#index"

      resources :trips do
        resources :destinations
        resources :registrations, only: [:index, :show, :create, :destroy]
      end

      resources :users
      resources :admins
      resources :airlines
      resources :hotels
    end

    root to: redirect("/admins/sign_in")
  end

  root to: "home#index"
end
