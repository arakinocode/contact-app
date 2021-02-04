Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  patch '/rooms/:id', to: 'rooms#update'
  resources :users, only: [:edit, :update]
  resources :rooms, only: [:index, :new, :create, :edit, :updata, :destroy] do
    resources :messages, only: [:index, :create]
    mount ActionCable.server, at: '/cable'
  end
end
