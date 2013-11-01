class CreateFoodNewsships < ActiveRecord::Migration
  def change
    create_table :food_newsships do |t|
      t.integer :news_id
      t.integer :food_id

      t.timestamps
    end
  end
end
