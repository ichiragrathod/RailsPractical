Rails.application.routes.draw do
  resources :employees
  get "/search", to: "employees#search"
end
