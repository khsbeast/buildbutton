class AddFaIconToStartupStage < ActiveRecord::Migration[6.1]
  def change
    add_column :startup_stages, :fa_icon, :string
  end
end
