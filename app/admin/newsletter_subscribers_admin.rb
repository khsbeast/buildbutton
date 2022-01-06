Trestle.resource(:newsletter_subscribers) do
  menu do
    item :newsletter_subscribers, icon: 'fa fa-star'
  end

  # Reference: https://github.com/TrestleAdmin/trestle/wiki/How-To:-Add-Custom-Action#example-2-adding-a-collection-action
  controller do
    def index
      toolbar(:primary) do |t|
        t.link('Export to CSV', admin.path(:export), target: '__blank')
      end
    end

    def export
      send_data NewsletterSubscriber.to_csv,
                filename: "NewsletterSubscribers-#{DateTime.now.strftime('%d/%m/%Y-%H:%M')}.csv"
    end
  end

  routes do
    get :export, on: :collection
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
  # form do |newsletter_subscriber|
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
  #   params.require(:newsletter_subscriber).permit(:name, ...)
  # end
end
