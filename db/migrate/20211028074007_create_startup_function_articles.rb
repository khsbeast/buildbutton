class CreateStartupFunctionArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :startup_function_articles do |t|
      t.references :startup_function, null: false, foreign_key: true
      t.references :core_article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
