Rails.application.routes.draw do
  get "/orders/:id/complete", controller: :orders, action: :complete, as: :complete_order
  get "/orders/:id/edit/:step_id", controller: :orders, action: :edit_from_step, as: :edit_order_from_step
  get "/orders/:id/edit/:step_id/separate_form", controller: :orders, action: :edit_from_step_separate_form, as: :edit_from_step_separate_form
  resources :orders
  get "/flipper", controller: :orders, action: :flipper
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
