class AddTableOfContentsAndInANutshellToCoreArticle < ActiveRecord::Migration[6.1]
  def change
    add_column :core_articles, :table_of_contents, :text
    add_column :core_articles, :in_a_nutshell, :text
    add_column :core_articles, :in_a_nutshell_points_count, :integer
    add_column :core_articles, :read_minutes, :integer
  end
end
