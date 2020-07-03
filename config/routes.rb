Rails.application.routes.draw do
  delete '/shelters/:id', to: 'shelters#destroy'
  get '/shelters', to: 'shelters#index'
  get '/shelters/new', to: 'shelters#new'
  post '/shelters', to: 'shelters#create'
  get '/shelters/:id/edit', to: 'shelters#edit'
  get '/shelters/:id/pets', to: 'shelters#pet_index'
  get '/shelters/:id', to: 'shelters#show'
  patch '/shelters/:id', to: 'shelters#update'

  get '/pets', to: 'pets#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
