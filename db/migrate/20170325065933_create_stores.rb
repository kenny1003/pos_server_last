class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.integer :user_id
      t.string :name #주점 이름





      t.timestamps null: false
    end
  end
end
