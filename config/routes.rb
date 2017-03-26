Rails.application.routes.draw do

  devise_for :users
  devise_for :admins

  namespace :admin do
    authenticated :admin do
      root to: "trips#index"

      resources :trips do
        resources :flight_appointments do
          member do
            get 'flight_tickets', to: 'flight_tickets#index'
            put 'flight_tickets', to: 'flight_tickets#update'
          end
        end

        resources :train_appointments
        resources :hotel_appointments do
          member do
            get 'hotel_reservations', to: 'hotel_reservations#index'
            put 'hotel_reservations', to: 'hotel_reservations#update'
          end
        end
        resources :visit_appointments

        resources :appointments do
          resources :milestones
        end

        resources :destinations do
          resources :events
        end

        resources :registrations, only: [:index, :show, :create, :destroy] do
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
  resources :documents, only: :index

  root to: "trips#index"
end
