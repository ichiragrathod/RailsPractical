Rails.application.routes.draw do
    resources :products
    resources :customers
    get 'display_all_products', to:'products#display_all_products', as: :display_all_products
    get 'display_active_products', to:'products#display_active_products', as: :display_active_products
    
end
