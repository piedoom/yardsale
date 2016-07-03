Rails.application.routes.draw do
  resources :items
  post 'items/:id', to: 'items#update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
