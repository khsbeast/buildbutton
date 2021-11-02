class AddContentTypeToCoreArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :core_articles, :content_type, :string
  end
end
