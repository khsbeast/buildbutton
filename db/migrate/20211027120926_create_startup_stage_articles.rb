class CreateStartupStageArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :startup_stage_articles do |t|
      t.references :core_article, null: false, foreign_key: true
      t.references :startup_stage, null: false, foreign_key: true

      t.timestamps
    end
  end
end
