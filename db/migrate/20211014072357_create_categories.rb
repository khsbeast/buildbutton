class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :slug
      t.string :title
      t.string :meta_description
      t.string :h1
      t.string :h2
      t.string :social_media_preview_image
      t.references :resource, null: true, foreign_key: true
      t.references :core_article, null: true, foreign_key: true

      t.timestamps
    end
  end
end
