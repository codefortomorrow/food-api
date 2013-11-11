class CreateFollowships < ActiveRecord::Migration
  def change
    create_table :followships do |t|
      t.string :user_id
      t.integer :food_id

      t.timestamps
    end
  end
end
