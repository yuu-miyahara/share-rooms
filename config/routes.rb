Rails.application.routes.draw do
  root to: "toppages#index"
  
  get "build_room",to: "rooms#new"
  get "build_nil_room",to: "rooms#new2"

  
  get 'enter_room', to: 'sessions#new'
  post 'enter_room', to: 'sessions#create'
  delete 'leave_room', to: 'sessions#destroy'
  get 'split_room', to: 'rooms#enter'
  post "direct_enter_room", to: "sessions#direct_enter"
  
  resources :rooms, only: [:show,:create] do
    collection do
      get "search"
      get "nil_enter_room"
    end
  end
  
  resources :users, only: [:update]
  resources :talks, only: [:create]
  resources :bans, only: [:create, :destroy]
end
