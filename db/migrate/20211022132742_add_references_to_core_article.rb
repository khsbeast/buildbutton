class AddReferencesToCoreArticle < ActiveRecord::Migration[6.1]
  def change
    add_reference :core_articles, :company, foreign_key: true
  end
end
