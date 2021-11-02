class AddCoverImageToCoreArticle < ActiveRecord::Migration[6.1]
  def change
    add_column :core_articles, :cover_image, :string
  end
end
