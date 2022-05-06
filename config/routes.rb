Rails.application.routes.draw do
  resources :users do
    member do
      get 'profile'
      patch 'update_profile'
      get 'change_password'
      patch 'update_password'
    end
  end
end
