class AddComingSoonToCoreArticle < ActiveRecord::Migration[6.1]
  def change
    add_column :core_articles, :coming_soon, :boolean, default: false
  end
end
