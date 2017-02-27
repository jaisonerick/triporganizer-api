Rails.application.routes.draw do
  namespace :admin do
    resources :users
  end
  devise_for :users
  devise_for :admins

  namespace :admin do
    authenticated :admin do
      root to: "dashboard#index"

      resources :users
    end

    root to: redirect("/admins/sign_in")
  end

  root to: "home#index"
end
