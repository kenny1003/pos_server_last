class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.integer :user_id
      t.string :name #주점 이름
      t.integer :goal #목표매출
      t.boolean :working, :default => false  #영업중인지 아닌지 확인, true 이면 영업중임
      t.boolean :billopen, :default => false




      t.timestamps null: false
    end
  end
end
