Rails.application.routes.draw do

  resources :employees
  
  get 'increase_order', to:'employees#increase_order', as: :increase_order
  get 'decrease_order', to:'employees#decrease_order', as: :decrease_order
  get 'employee_querys', to:'employees#employee_querys', as: :employee_querys
end
