Rails.application.routes.draw do
  resources :messages
  resources :rooms
  resources :replies
  resources :users
  resources :affiliations
  resources :sessions
  resources :votes
  resources :voteaffiliations

  get "/logout", to: "sessions#destroy"

  root to: "messages#index"

end
