class AddReferencesToCompany < ActiveRecord::Migration[6.1]
  def change
    add_reference :companies, :core_article, foreign_key: true
  end
end
