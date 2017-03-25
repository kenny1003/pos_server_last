class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :name
      t.string :category
      t.integer :price
      t.integer :store_id

      t.timestamps null: false
    end
  end
end
