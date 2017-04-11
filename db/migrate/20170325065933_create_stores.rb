class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.integer :user_id
      t.string :name #주점 이름
      # t.integer :input_cost #투입비용
      # t.integer :cash #보유현금
      t.integer :incometoday, :default => 0
      t.integer :incomeall, :default => 0
      t.boolean :working, :default => false  #영업중인지 아닌지 확인, true 이면 영업중임
      t.boolean :billopen, :default => false

      t.string :major #주점의 전공 정보, 주점을 생성할 때 적도록 한다.
      t.boolean :confirmation, :default => false #인증된 코드로 생성된 주점인지 확인



      t.timestamps null: false
    end
  end
end
