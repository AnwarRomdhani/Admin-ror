# config/routes.rb

Rails.application.routes.draw do
  resources :supporttickets, only: [:index, :show, :destroy] do
    member do
      post 'create_response'
      patch 'close_ticket'
    end

    resources :responses, only: [:destroy]
  end

  root 'supporttickets#index'
end
