Rails.application.routes.draw do
  root 'categories#home'

  post '/create_newsletter_subscriber' => "categories#create_newsletter_subscriber", :as => "create_newsletter_subscriber"

  get 'all-posts', to:'resources#index'
  #categories
  get 'marketing', to:'categories#index'
  get 'funding', to:'categories#index'
  get 'product', to:'categories#index'
  get ':category-glossary', to:'categories#glossary'

  get '/:category/:slug', to:'categories#show'
  #general blog route
  get ':slug', to:"resources#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
