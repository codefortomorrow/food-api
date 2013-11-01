class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.timestamp :timestamp
      t.string :abstract
      t.text   :text
      t.string :link
      t.string :source

      t.timestamps
    end
  end
end
