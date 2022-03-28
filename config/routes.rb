Rails.application.routes.draw do
  resources :orders
  get "/orders/:id/edit/:step_id", controller: :orders, action: :edit_from_step, as: :edit_order_from_step
  get "/flipper", controller: :orders, action: :flipper
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
