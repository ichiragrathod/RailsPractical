Rails.application.routes.draw do

  # root "articles#index"
  resources :authors
  resources :books

end
