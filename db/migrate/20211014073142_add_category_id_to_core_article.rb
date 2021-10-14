class AddCategoryIdToCoreArticle < ActiveRecord::Migration[6.1]
  def change
    add_reference :core_articles, :category, null: true, foreign_key: true
  end
end
