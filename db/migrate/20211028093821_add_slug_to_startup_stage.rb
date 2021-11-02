class AddSlugToStartupStage < ActiveRecord::Migration[6.1]
  def change
    add_column :startup_stages, :slug, :string
  end
end
