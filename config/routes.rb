Rails.application.routes.draw do
  root 'sessions#login'
  get 'sessions/login', to: 'sessions#login', as: :new_session
  post 'sessions/login', to: 'sessions#check'
  delete 'sessions/logout', to: 'sessions#destroy', as: :destroy_session
  resources :users, only:[:new, :create, :show]
  resources :articles, only:[:new, :create, :show, :index]
  resources :votes, only:[:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
