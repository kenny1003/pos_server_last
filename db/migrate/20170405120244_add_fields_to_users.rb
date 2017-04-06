class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :phone_number, :string
    add_column :users, :admin_check, :boolean, :default => false #관리자 권한 부여
  end
end
