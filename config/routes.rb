Rails.application.routes.draw do
  resources :buses
  resources :users
  resources :bus_owners
  devise_for :bus_owners, controllers: {
        sessions: 'bus_owners/sessions'
      }

  # devise_for :users


       devise_for :users, controllers: {
        sessions: 'users/sessions'
      }



     # authenticated :user do
     #   root "users#show"
     # end


     # authenticated :user do
     #   root "bus_owners#show"
     # end


    root to: "buses#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
