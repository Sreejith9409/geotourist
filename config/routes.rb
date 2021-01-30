Rails.application.routes.draw do
  get 'dashboard/index'
  get 'dashboard/get_analytics_data'
  resources :visits
  resources :views
  resources :points
  resources :tours
  resources :users
  root "dashboard#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
