Rails.application.routes.draw do
  get 'members/new'
  get 'members/results'
  get 'members/index'
  get 'names/new'
  get 'names/results'
  get 'names/index'
  root 'members#new'
  post 'members/new'
  resources :members
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
