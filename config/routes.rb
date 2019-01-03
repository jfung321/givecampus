Rails.application.routes.draw do
  resources :matches
  resources :donations
  resources :funds
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
get 'main', to: 'application#main', as: :main
root 'application#main'
end
