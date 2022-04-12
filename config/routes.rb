Rails.application.routes.draw do
  

  resources :products do
    resources :orders
  end
end
