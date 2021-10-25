class ChangeDataTypeForContent < ActiveRecord::Migration[6.1]
  def change
    change_column :core_articles, :content, :text
  end
end
