Rails.application.routes.draw do
  resources :greeting_cards
  get 'home/index'
  root 'greeting_cards#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
