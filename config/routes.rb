Rails.application.routes.draw do

  resources :buses

  get "buses/:id/active" => "buses#active" ,as: :activate_bus
  get "buses/:id/suspend" => "buses#suspend" ,as: :suspend_bus
  get "reservations/filter/:scope" => "reservations#index", as: :filtered_reservations
  get "buses/filter/:scope" => "buses#index", as: :filtered_buses

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


    root to: "buses#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
