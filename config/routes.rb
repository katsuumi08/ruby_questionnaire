Rails.application.routes.draw do
  resources :ideas
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "pages#homepage"

  get 'pages/result_homepage', to: 'pages#result_homepage', as: :result_homepage 
  get 'pages/:id/result', to: 'pages#result', as: :result
  
  get 'pages/createPage'

  get 'pages/new', to: 'pages#new', as: :new_survey
  post 'pages', to: 'pages#create', as: :surveys
  get 'pages/:id', to: 'pages#show', as: :survey
  post 'pages/vote', to: 'pages#vote', as: :vote
end
