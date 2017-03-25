class CreateSalesmenus < ActiveRecord::Migration
  def change
    create_table :salesmenus do |t|
      t.integer :menu_id
      t.integer :qty
      t.integer :bill_id

      t.timestamps null: false
    end
  end
end
