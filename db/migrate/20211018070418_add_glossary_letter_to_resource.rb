class AddGlossaryLetterToResource < ActiveRecord::Migration[6.1]
  def change
    add_column :resources, :glossary_letter, :string
  end
end
