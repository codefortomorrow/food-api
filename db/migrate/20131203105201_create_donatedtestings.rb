class CreateDonatedtestings < ActiveRecord::Migration
  def change
    create_table :donatedtestings do |t|
      t.string :proposer
      t.string :title
      t.text   :description
      t.float  :target_amount
      t.float  :current_amount
      t.timestamp :start_date
      t.timestamp :deadline
      
      t.timestamps
    end
  end
end
