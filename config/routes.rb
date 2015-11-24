Rails.application.routes.draw do
  resources :users
  resource :session
  resources :goals
  resources :goal_comments
  resources :user_comments
end
