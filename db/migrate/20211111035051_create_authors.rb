class CreateAuthors < ActiveRecord::Migration[6.1]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :website
      t.string :linkedin
      t.string :twitter
      t.string :instagram
      t.string :pic
      t.string :bio

      t.timestamps
    end
  end
end
