class CreateStartupStages < ActiveRecord::Migration[6.1]
  def change
    create_table :startup_stages do |t|
      t.string :name
      t.string :order

      t.timestamps
    end
  end
end
