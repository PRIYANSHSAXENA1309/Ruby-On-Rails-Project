Rails.application.routes.draw do
  root 'matrices#index'
  post 'multiply', to: 'matrices#multiply'
end