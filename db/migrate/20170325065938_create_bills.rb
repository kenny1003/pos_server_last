class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.integer :store_id
      t.integer :salesmenu_id
      t.integer :workperiod_id
      t.integer :totalprice, :default => 0


      t.timestamps null: false
    end
  end
end
