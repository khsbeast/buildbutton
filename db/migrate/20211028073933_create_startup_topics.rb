class CreateStartupTopics < ActiveRecord::Migration[6.1]
  def change
    create_table :startup_topics do |t|
      t.string :name
      t.string :order

      t.timestamps
    end
  end
end
