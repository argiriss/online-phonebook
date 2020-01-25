Rails.application.routes.draw do
  resources :addresses
  resources :contact_details
  devise_for :users, controllers: {
    registrations: 'my_registrations'
  }

  resources :users

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
