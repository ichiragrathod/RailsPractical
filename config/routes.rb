Rails.application.routes.draw do
  resources :events do
    resources :comments, module: :events
  end
  resources :categories
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :users, except: [:new]
  root to:'pages#home'
end
