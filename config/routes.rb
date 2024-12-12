Rails.application.routes.draw do
  # Root route
  root "chat_rooms#index"

  # User-related routes
  resources :users

  # Chat room routes
  resources :chat_rooms, except: [:destroy] do
    member do
      delete :destroy
    end
  end

  # Message routes
  resources :messages, only: [:create]

  # Session-related routes
  resource :session, only: [:new, :create, :destroy]
  delete "/logout", to: "sessions#destroy", as: :logout # Explicit logout route alias

  # Turbo Rails default routes (for navigation)
  namespace :turbo do
    namespace :native do
      get "/recede_historical_location", to: "navigation#recede"
      get "/resume_historical_location", to: "navigation#resume"
      get "/refresh_historical_location", to: "navigation#refresh"
    end
  end
end
