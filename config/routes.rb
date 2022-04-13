Rails.application.routes.draw do

  resources :products do
    resources :orders
  end

  namespace :business do
    resources :customers, only: [:create, :index, :edit, ] do
      get 'new', on: :collection, as:'new'
      get 'preview', on: :member
      delete 'delete_customer', on: :member
      patch 'update', on: :member
      get 'search', on: :collection
    end
  end

  root "products#index"

end
