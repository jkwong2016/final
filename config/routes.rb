Rails.application.routes.draw do
  resources :messages
  resources :rooms
  resources :replies
  resources :users
  resources :affiliations
  resources :sessions

  get "/logout", to: "sessions#destroy"

  root to: "messages#index"

end
