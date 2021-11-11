class AddAuthorReferenceToCoreArticles < ActiveRecord::Migration[6.1]
  def change
    add_reference :core_articles, :author, foreign_key: true
  end
end
