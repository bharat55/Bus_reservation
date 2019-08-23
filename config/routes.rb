Rails.application.routes.draw do
devise_for :bus_owners
devise_for :users

  namespace :admin do
    resources :buses do
      member do
        get "active"
        get "suspend"
      end
    end
    resources :bus_owners do
      member do
        get "approve"
        get "suspend"
      end
    end
  end

  namespace :bus_owners do
    resources :buses do
      resources :reservations,only:[:index]
      member do
        get "active"
        get "suspend"
      end
    end
  end


  resources :buses do
    resources :reservations do
     delete "cancel" =>"reservations#cancel"
    end
  end

  resources :book_bus_seats,only:[:index]
  resources :users
  resources :bus_owners




  # get "/book_bus_seats/show" => "book_bus_seats#show"
  get "reservations/filter/:scope" => "reservations#index", as: :filtered_reservations
  get "search/buses" => "buses#index", as: :search_bus

  root to: "buses#index"

  get "/*args"=>"buses#index"

  # get "reservations/new/:id" => "reservations#new", as: :new_reservation



  # devise_for :users








     # authenticated :user do
     #   root "users#show"
     # end


     # authenticated :user do
     #   root "bus_owners#show"
     # end





  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
