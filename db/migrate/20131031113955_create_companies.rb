class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :company_no
      t.string :owner_name
      t.string :address
      t.string :phone_no

      t.timestamps
    end
  end
end
