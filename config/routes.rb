Rails.application.routes.draw do
  # Root route
  root "chat_rooms#index"

  # Resources
  resources :users
  resources :chat_rooms
  resources :messages, only: [:create]

  # Sessions routes
  resource :session, only: [:new, :create, :destroy]
  get "/logout", to: "sessions#destroy", as: :logout # Explicit logout route alias

  # Turbo Rails default routes
  get "/recede_historical_location", to: "turbo/native/navigation#recede"
  get "/resume_historical_location", to: "turbo/native/navigation#resume"
  get "/refresh_historical_location", to: "turbo/native/navigation#refresh"
end
