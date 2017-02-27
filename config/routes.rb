Rails.application.routes.draw do
  devise_for :users
  devise_for :admins

  namespace :admin do
    authenticated :admin do
      root to: "dashboard#index"

      resources :users
      resources :admins
      resources :airlines
    end

    root to: redirect("/admins/sign_in")
  end

  root to: "home#index"
end
