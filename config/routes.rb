Rails.application.routes.draw do
  root "home#index"

  get '/login' => 'sessions#new'
  get '/auth/github/callback' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/organizations', to: 'organizations#index'

  get '/organizations/:id/pull_requests', to: 'organizations#pull_requests', as: :pull_requests_for_org
end
