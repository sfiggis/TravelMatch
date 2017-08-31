Rails.application.routes.draw do
  mount ImageUploader::UploadEndpoint => "/images"
  resources :images, only: [:new, :create, :index, :edit, :update]
  default_url_options :host => 'localhost'
  devise_for :travellers, :controllers => {sessions: 'travellers/sessions', :registrations => 'travellers/registrations'}
  devise_for :admins, controllers: { sessions: 'admins/sessions', registrations: 'admins/registrations' }
  authenticate :traveller do
    resources :travellers, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :admins, only: [:index, :show]

  # devise_scope :admin do
    # authenticated  do
    #   root to: 'admins#index'
    # end

  #   unauthenticated do
  #     root to: 'admins/sessions#new'
  #   end
  # end

  devise_scope :traveller do
    authenticated  do
      root to: 'home#index'
    end

    unauthenticated do
      root to: 'travellers/sessions#new'
    end
  end
  authenticate :admin do
    resources :countries, only: [:new, :create, :edit, :update, :destroy]
    resources :airports, only: [:new, :create, :edit, :update, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :travellers
  resources :searches
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
