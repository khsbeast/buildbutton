class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :company_name
      t.string :company_logo
      t.string :linkedin_url
      t.string :funding_status
      t.integer :founded_year
      t.integer :company_size
      t.string :website_link
      t.string :company_twitter
      t.string :business_model
      t.integer :annual_revenue
      t.string :location

      t.timestamps
    end
  end
end
