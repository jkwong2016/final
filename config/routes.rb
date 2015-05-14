Rails.application.routes.draw do
  resources :messages
  resources :rooms
  resources :replies
  resources :users
  resources :affiliations
end
