Rails.application.routes.draw do
  root to: 'throws#new'
  resources :throws, only:[:create]
end
