class CreateTestprojects < ActiveRecord::Migration
  def change
    create_table :testprojects do |t|
      t.string :proposer
      t.string :title
      t.string :testers
      t.string :test_items
      t.integer :product_id
      t.text   :description
      t.float  :target_amount
      t.float  :current_amount
      t.integer:current_donators
      t.timestamp :start_date
      t.timestamp :deadline

      t.timestamps
    end
  end
end
