Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :peticiones
  resource :tipos
  resource :usuarios
  resource :interceder
  resource :mensajeria

  post 'auth/register', to: 'usuarios#register'
  post 'auth/login', to: 'usuarios#login'
  post 'peticiones/cancela', to: 'peticiones#cancela'
  post 'peticiones/finaliza', to: 'peticiones#finaliza'
  post 'peticiones/cancelaintercesion', to: 'peticiones#cancelaintercesion'

  
end
