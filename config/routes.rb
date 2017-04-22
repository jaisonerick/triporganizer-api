Rails.application.routes.draw do

  devise_for :users
  devise_for :admins

  namespace :api, defaults: { format: :json } do
    resource :session, only: [:create]
    resource :user, only: [:show]
    resources :trips, only: :index
  end

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

        resources :train_appointments do
          member do
            get 'train_tickets', to: 'train_tickets#index'
            put 'train_tickets', to: 'train_tickets#update'
          end
        end
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

        resources :registrations, only: [:index, :edit, :update, :create, :destroy]

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

  resources :trips, only: [:index, :show] do
    resources :documents, only: :index

    member do
      get 'passport'
      put 'passport', to: 'trips#update_passport'

      get 'insurance'
    end
  end


  root to: "trips#index"
end
