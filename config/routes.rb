Rails.application.routes.draw do
  mount ImageUploader::UploadEndpoint => "/images"
  resources :images, only: [:new, :create, :index, :edit, :update]
  default_url_options :host => 'localhost'
  devise_for :travellers, :controllers => {:registrations => 'travellers/registrations'}
  devise_for :admins, controllers: { sessions: 'admins/sessions' }
  authenticate :traveller do
    resources :travellers, only: [:new, :create, :edit, :update, :destroy]
  end

  devise_scope :admin do
    get 'sign_in', to: 'admins/sessions#new'
    root :to => 'admins#show'
  end
  authenticate :admin do
    resources :countries, only: [:new, :create, :edit, :update, :destroy]
    resources :airports, only: [:new, :create, :edit, :update, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :travellers
  resources :searches
  root to: "home#index"
  resources :countries, :only => [:edit, :create, :show, :update]
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
      put :get_flights
      patch :get_flights
    end
  end
end
