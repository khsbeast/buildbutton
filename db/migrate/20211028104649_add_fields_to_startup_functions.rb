class AddFieldsToStartupFunctions < ActiveRecord::Migration[6.1]
  def change
    add_column :startup_functions, :slug, :string
    add_column :startup_functions, :logo, :string
    add_column :startup_functions, :title, :string
    add_column :startup_functions, :meta_description, :text
    add_column :startup_functions, :h1, :string
    add_column :startup_functions, :h2, :string
  end
end
