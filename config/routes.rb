Rails.application.routes.draw do
  get '/team', to: 'static_pages#team'
  get '/contact', to: 'static_pages#contact'

  get '/', to: 'dynamic_pages#index'
  get 'welcome/:first_name', to: 'dynamic_pages#welcome'
  get 'potin/:id_potin', to: 'dynamic_pages#potin'
  get 'user/:user_id', to: 'dynamic_pages#user'
end
