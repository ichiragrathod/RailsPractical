Rails.application.routes.draw do
  
  # root "articles#index"
  resources :students
  resources :faculties
end
