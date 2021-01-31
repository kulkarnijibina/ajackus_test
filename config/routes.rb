Rails.application.routes.draw do
  resources :messages, only: [:index]
  resources :messages,only: [:create], format: :js
  match "*unmatched", to: 'messages#index', via: :all
  root "messages#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
