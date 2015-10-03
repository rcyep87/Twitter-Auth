Rails.application.routes.draw do
  resources :tweets
  resources :users

  get     '/login',  to: 'sessions#new',     as: 'new_login'
  post    '/login',  to: 'sessions#create',  as: 'login'
  delete  '/logout', to: 'sessions#destroy', as: 'logout'

  get     'home'   , to: 'homepage#index'  , as: 'homepage'

  root 'homepage#index'
end
