class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.integer :user_id
      t.integer :workperiod_id
      t.string :name

asa



      t.timestamps null: false
    end
  end
end
