Rails.application.routes.draw do
  resources :buses


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
