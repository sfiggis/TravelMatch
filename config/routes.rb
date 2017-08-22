Rails.application.routes.draw do
  default_url_options :host => 'localhost'
  devise_for :travellers, :controllers => {:registrations => 'travellers/registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :travellers
  resources :searches
  root to: "home#index"
  resources :countries, :only => [:create, :show, :update]
  resources :searches do
    member do
      put :update_matches
      get :matches
    end
  end
  resources :airports, :only => [:update]
  resources :airports do
    member do
      put :capital_update
      get :capital_flights
    end
  end
end
