Rails.application.routes.draw do
  resources :messages do
    resources :replies
  end  
  resources :rooms
  resources :users
  resources :affiliations
  resources :sessions
  resources :votes
  resources :voteaffiliations

  get "/logout", to: "sessions#destroy"

  root to: "messages#index"

end
