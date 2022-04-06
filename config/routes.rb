Rails.application.routes.draw do
  resources :events
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
end
