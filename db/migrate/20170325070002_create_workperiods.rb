class CreateWorkperiods < ActiveRecord::Migration
  def change
    create_table :workperiods do |t|
      t.integer :store_id
      t.string :startingtime
      t.string :finishtime


      t.timestamps null: false
    end
  end
end
