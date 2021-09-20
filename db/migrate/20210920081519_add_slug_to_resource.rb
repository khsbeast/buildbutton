class AddSlugToResource < ActiveRecord::Migration[6.1]
  def change
    add_column :resources, :slug, :string
  end
end
