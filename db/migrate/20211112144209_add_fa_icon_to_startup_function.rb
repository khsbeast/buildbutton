class AddFaIconToStartupFunction < ActiveRecord::Migration[6.1]
  def change
    add_column :startup_functions, :fa_icon, :string
  end
end
