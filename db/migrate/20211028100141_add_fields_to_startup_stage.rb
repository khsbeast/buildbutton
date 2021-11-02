class AddFieldsToStartupStage < ActiveRecord::Migration[6.1]
  def change
    add_column :startup_stages, :logo, :string
    add_column :startup_stages, :title, :string
    add_column :startup_stages, :meta_description, :text
    add_column :startup_stages, :h1, :string
    add_column :startup_stages, :h2, :string
  end
end
