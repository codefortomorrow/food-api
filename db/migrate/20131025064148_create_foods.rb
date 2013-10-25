class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      # basic information
      t.string :barcode
      t.string :company_name
      t.string :product_name
      t.float  :capacity
      t.string :capacity_unit

      # nutrition
      t.float  :calories_kcal
      t.float  :carbohydrate_g
      t.float  :fat_g
      t.float  :fat_saturated_g
      t.float  :fat_trans_g
      t.float  :protein_g
      t.float  :sodium_mg

      t.timestamps
    end
  end
end
