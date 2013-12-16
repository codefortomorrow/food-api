class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.string :email
      t.string :account_type
      t.string :name
      t.float  :balance
      t.timestamp :last_login_time

      t.timestamps
    end
  end
end
