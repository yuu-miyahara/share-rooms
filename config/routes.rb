Rails.application.routes.draw do
  root to: "toppages#index"
  
  get "build_room",to: "rooms#new"
  
  get 'enter_room', to: 'sessions#new'
  post 'enter_room', to: 'sessions#create'
  delete 'leave_room', to: 'sessions#destroy'
  
  resources :rooms, only: [:show,:create] do
    collection do
      get "search"
    end
  end
  
  resources :users, only: [:update]
  resources :talks, only: [:create]
  resources :bans, only: [:create, :destroy]
end
