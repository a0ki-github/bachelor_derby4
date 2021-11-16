Rails.application.routes.draw do
  root 'home#index'
  namespace :admin do
    resources :candidates
    resources :episodes
  end
  namespace :api, format: 'json' do
    resources :sessions, only: %i(create destroy)
    resources :users, only: %i(create update) do
      get 'me', on: :collection
      get 'name_index', on: :collection
    end
    resources :bettings, only: %i(create)
    resources :candidates, only: %i(index)
  end
  get '*path', to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
