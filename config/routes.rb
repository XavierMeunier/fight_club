Rails.application.routes.draw do
  get 'pages/home'
  # Root
  root 'pages#home'
end
