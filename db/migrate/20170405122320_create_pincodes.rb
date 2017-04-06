class CreatePincodes < ActiveRecord::Migration
  def change
    create_table :pincodes do |t|

      t.integer :pincode
      t.boolean :used, :default=>false #핀코드가 사용중인지 아닌지 확인
      t.integer :storeid
      t.string :major #해당 핀코드의 주점 전공을 나타낸다.
      t.string :memo #인증코드에 대한 메모내용, ex 이 코드는 전자과한테 배부할 코드임...등등..

      t.timestamps null: false
    end
  end
end
