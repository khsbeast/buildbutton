class AddComingSoonDateToCoreArticle < ActiveRecord::Migration[6.1]
  def change
    add_column :core_articles, :coming_soon_date, :date
  end
end
