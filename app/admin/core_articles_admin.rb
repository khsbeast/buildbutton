Trestle.resource(:core_articles) do
  menu do
    item :core_articles, icon: "fa fa-star"
  end

  table do
    column :id
    column :title
  end

  form do |core_article|
     text_field :title
     check_box :coming_soon
     text_field :content_type, label: "Content Type (news OR article)"
     text_field :meta_description
     text_field :h1
     text_field :h2
     text_area :content
     text_field :index_title
     date_field :index_date
     text_area :top_articles
     text_area :top_articles_urls
     text_area :related_articles
     text_area :related_articles_urls
     check_box :sticky_sidebar
     text_field :social_media_preview_image
     text_field :slug
     text_field :canonical_url
     text_field :cover_image
     select :category_id, Category.all.map(), { label: "Category" }
     select :company_id, Company.all.map(), { label: "Company" }
     select :author_id, Author.all.map(), { label: "Author" }
     select :startup_stage_ids, StartupStage.all.map(), { label: "Startup Stages" }, multiple:true
     select :startup_function_ids, StartupFunction.all.map(), { label: "Startup Functions" }, multiple:true
     select :startup_topic_ids, StartupTopic.all.map(), { label: "Startup Topics" }, multiple:true

    row do
      col { datetime_field :updated_at }
      col { datetime_field :created_at }
    end
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
  # form do |core_article|
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
  #   params.require(:core_article).permit(:name, ...)
  # end
end
