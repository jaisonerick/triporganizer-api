Rails.application.routes.draw do
  devise_for :admins
  devise_for :users

  namespace :admin do
    root to: "dashboard#index"
  end

  root to: "home#index"
end
