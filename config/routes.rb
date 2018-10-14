Rails.application.routes.draw do
  root 'pages#home'

  resources :fighters
  get '/fighters/:id/shape',     to: "fighters#shape",   as: "shape_fighter"
  post '/fighters/:id/upgrade',  to: "fighters#upgrade", as: "upgrade_fighter"
end
