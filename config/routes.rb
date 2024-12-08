Rails.application.routes.draw do
  root "chat_rooms#index"

  resources :users
  resources :chat_rooms
  resources :messages, only: [:create]

  # Sessions routes
  resource :session, only: [:new, :create, :destroy]

  # Turbo Rails default routes
  get "/recede_historical_location", to: "turbo/native/navigation#recede"
  get "/resume_historical_location", to: "turbo/native/navigation#resume"
  get "/refresh_historical_location", to: "turbo/native/navigation#refresh"

  get "/session", to: "sessions#destroy", as: :logout

end
 