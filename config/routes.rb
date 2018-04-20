Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :peticiones
  resource :tipos
  resource :usuarios
  resource :interceder

  post 'auth/register', to: 'usuarios#register'
  post 'auth/login', to: 'usuarios#login'
end
