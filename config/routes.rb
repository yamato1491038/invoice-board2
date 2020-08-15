Rails.application.routes.draw do
  #mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root "results#index"

  resources :results, only: [:index, :new, :create, :show, :destroy] do
    collection do
      get 'search'
    end
  end

  resources :works,　only: [:new, :create]
end
