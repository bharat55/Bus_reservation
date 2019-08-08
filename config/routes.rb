Rails.application.routes.draw do

  resources :buses
  get "/book_bus_seats/show" => "book_bus_seats#show"
  get "buses/:id/active" => "buses#active" ,as: :activate_bus
  get "buses/:id/suspend" => "buses#suspend" ,as: :suspend_bus
  get "reservations/filter/:scope" => "reservations#index", as: :filtered_reservations
  get "reservations/:id" => "reservations#index", as: :bus_reservations
  get "buses/filter/:scope" => "buses#index", as: :filtered_buses
  get "search/bus" => "home#index", as: :search_bus



  get "reservations/new/:id" => "reservations#new", as: :new_reservation

  resources :reservations
  devise_for :bus_owners, controllers: {
        sessions: 'bus_owners/sessions'
      }
  # devise_for :users
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }


  get "bus_owners/approve/:id" => "bus_owners#approve" ,as: :approve_owner
  get "bus_owners/disapprove/:id" => "bus_owners#disapprove" ,as: :disapprove_owner
  get "bus_owners/suspend/:id" => "bus_owners#suspend", as: :suspend_owner
  resources :users
  resources :bus_owners



     # authenticated :user do
     #   root "users#show"
     # end


     # authenticated :user do
     #   root "bus_owners#show"
     # end


    root to: "home#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
