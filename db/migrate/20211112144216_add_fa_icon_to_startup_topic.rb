class AddFaIconToStartupTopic < ActiveRecord::Migration[6.1]
  def change
    add_column :startup_topics, :fa_icon, :string
  end
end
