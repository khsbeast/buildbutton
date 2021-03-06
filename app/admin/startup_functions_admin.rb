Trestle.resource(:startup_functions) do
  menu do
    item :startup_functions, icon: "fa fa-star"
  end

  form do |startup_function|
    text_field :name
    text_field :slug
    text_field :logo
    text_field :fa_icon
    text_field :order
    select :core_article_ids, CoreArticle.all.map(), { label: "Core Articles" }, multiple: true
    table CoreArticlesAdmin.table, collection: startup_function.core_articles.includes(:startup_functions)
  end

  # Customize the table columns shown on the index view.
  #
  # table do
  #   column :name
  #   column :created_at, align: :center
  #   actions
  # end

  # Customize the form fields shown on the new/edit views.
  #
  # form do |startup_function|
  #   text_field :name
  #
  #   row do
  #     col { datetime_field :updated_at }
  #     col { datetime_field :created_at }
  #   end
  # end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:startup_function).permit(:name, ...)
  # end
end
