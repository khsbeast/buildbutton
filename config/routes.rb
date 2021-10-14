Rails.application.routes.draw do
  root 'resources#index'
  #get 'resources/index'
  #categories
  get 'marketing', to:'categories/index'
  get 'funding', to:'categories/index'
  get 'product', to:'categories/index'
  get '/marketing/:slug', to:'resources#show'
  get '/funding/:slug', to:'resources#show'
  get '/product/:slug', to:'resources#show'

  #general blog route
  get ':slug', to:"resources#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
