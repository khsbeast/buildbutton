Rails.application.routes.draw do
  root 'resources#index'
  #get 'resources/index'
  get ':slug', to:"resources#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
