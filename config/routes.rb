Rails.application.routes.draw do
  devise_for :users
  devise_for :admins

  namespace :admin do
    authenticated :admin do
      root to: "trips#index"

      resources :trips do
        resources :destinations do
          resources :events
        end

        resources :registrations, only: [:index, :show, :create, :destroy] do
          resources :boarding_tickets
          resources :hotel_reservations
          resources :transits
        end

        resources :flights
        resources :transports
      end

      resources :users
      resources :admins
      resources :companies
      resources :airlines
      resources :hotels
      resources :places
    end

    root to: redirect("/admins/sign_in")
  end

  root to: "home#index"
end
