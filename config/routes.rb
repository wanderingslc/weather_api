Rails.application.routes.draw do
  get 'home/index'
  post 'home/api_call'
  root 'home#index'
end
