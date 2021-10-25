class AddSlugToCompany < ActiveRecord::Migration[6.1]
  def change
    add_column :companies, :slug, :string
  end
end
