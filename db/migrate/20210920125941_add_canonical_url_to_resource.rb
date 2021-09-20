class AddCanonicalUrlToResource < ActiveRecord::Migration[6.1]
  def change
    add_column :resources, :canonical_url, :string
  end
end
