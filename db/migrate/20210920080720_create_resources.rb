class CreateResources < ActiveRecord::Migration[6.1]
  def change
    create_table :resources do |t|
      t.string :title
      t.string :meta_description
      t.string :h1
      t.string :h2
      t.text :content
      t.string :index_title
      t.date :index_date
      t.text :top_articles
      t.text :top_articles_urls
      t.text :related_articles
      t.text :related_articles_urls
      t.boolean :sticky_sidebar
      t.string :social_media_preview_image

      t.timestamps
    end
  end
end
