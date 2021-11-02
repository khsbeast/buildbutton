class AddFieldsToStartupTopics < ActiveRecord::Migration[6.1]
  def change
    add_column :startup_topics, :slug, :string
    add_column :startup_topics, :logo, :string
    add_column :startup_topics, :title, :string
    add_column :startup_topics, :meta_description, :text
    add_column :startup_topics, :h1, :string
    add_column :startup_topics, :h2, :string
  end
end
