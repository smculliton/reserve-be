Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do 
      resources :reservations
      resources :availability, only: [:index]
      resources :restaurants, only: [:index]
    end
  end
end
