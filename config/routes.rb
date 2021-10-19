Rails.application.routes.draw do
  root 'categories#home'

  post '/create_newsletter_subscriber' => "categories#create_newsletter_subscriber", :as => "create_newsletter_subscriber"

  get 'all-posts', to:'resources#index'
  #categories
  resources :category, path: "remote-work" do
  	collection do
      match "/:id", to: "newsletter#show", via: [:get]
    end
  end
  get ':category-glossary', to:'categories#glossary'
  get '/:category/:slug', to:'categories#show'
  get ':category', to: 'categories#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
