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
          resources :hotel_reservations
          resources :transits

          member do
            get :itinerary
          end
        end

        resources :transports
      end

      resources :users
      resources :admins
      resources :companies
      resources :hotels
      resources :places
    end

    root to: redirect("/admins/sign_in")
  end

  resources :trips, only: [:index, :show]
  root to: "trips#index"
end
