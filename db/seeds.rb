#seed : Store
#t.integer :user_id
#t.string :name #주점 이름
#t.integer :goal #목표매출
Store.create(:name => '1st', :user_id => 1, :goal => 10000)
Store.create(:name => '1st', :user_id => 2, :goal => 20000)
Store.create(:name => '2rd', :user_id => 1, :goal => 30000)
Store.create(:name => '2rd', :user_id => 2, :goal => 40000)
#--------------------------------------------------------------------------
#seed : Bill
# t.integer :store_id
# t.integer :salesmenu_id
# t.integer :workperiod_id
# t.integer :totalprice

Bill.create(:store_id => 1, :salesmenu_id => 1, :workperiod_id => 1, :totalprice => 1)
Bill.create(:store_id => 1, :salesmenu_id => 2, :workperiod_id => 1, :totalprice => 1)
Bill.create(:store_id => 1, :salesmenu_id => 1, :workperiod_id => 2, :totalprice => 1)
Bill.create(:store_id => 1, :salesmenu_id => 2, :workperiod_id => 2, :totalprice => 1)
Bill.create(:store_id => 1, :salesmenu_id => 1, :workperiod_id => 1, :totalprice => 2)
Bill.create(:store_id => 1, :salesmenu_id => 2, :workperiod_id => 1, :totalprice => 2)
Bill.create(:store_id => 1, :salesmenu_id => 1, :workperiod_id => 2, :totalprice => 2)
Bill.create(:store_id => 1, :salesmenu_id => 2, :workperiod_id => 2, :totalprice => 2)

Bill.create(:store_id => 2, :salesmenu_id => 1, :workperiod_id => 1, :totalprice => 1)
Bill.create(:store_id => 2, :salesmenu_id => 2, :workperiod_id => 1, :totalprice => 1)
Bill.create(:store_id => 2, :salesmenu_id => 1, :workperiod_id => 2, :totalprice => 1)
Bill.create(:store_id => 2, :salesmenu_id => 2, :workperiod_id => 2, :totalprice => 1)
Bill.create(:store_id => 2, :salesmenu_id => 1, :workperiod_id => 1, :totalprice => 2)
Bill.create(:store_id => 2, :salesmenu_id => 2, :workperiod_id => 1, :totalprice => 2)
Bill.create(:store_id => 2, :salesmenu_id => 1, :workperiod_id => 2, :totalprice => 2)
Bill.create(:store_id => 2, :salesmenu_id => 2, :workperiod_id => 2, :totalprice => 2)

#--------------------------------------------------------------------------
#seed : menu
#t.string :name
#t.string :category
#t.integer :price
#t.integer :store_id

Menu.create(:store_id => 1, :price => 10000, :category => "c",  :name =>"A")
Menu.create(:store_id => 1, :price => 20000, :category => "A",  :name =>"B")
Menu.create(:store_id => 2, :price => 10000, :category => "C",  :name =>"C")
Menu.create(:store_id => 2, :price => 20000, :category => "D",  :name =>"D")

#--------------------------------------------------------------------------
# Seed : workperiod
# t.integer :store_id
# t.string :startingtime
# t.string :finishtime

Workperiod.create(:store_id => 1, :startingtime => "1", :finishtime => "2")
Workperiod.create(:store_id => 1, :startingtime => "3", :finishtime => "4")
Workperiod.create(:store_id => 2, :startingtime => "1", :finishtime => "2")
Workperiod.create(:store_id => 2, :startingtime => "3", :finishtime => "4")

#--------------------------------------------------------------------------
# Seed : salesmenu
# t.integer :menu_id
# t.integer :qty
# t.integer :bill_id

Salesmenu.create(:bill_id => 1, :menu_id => 1, :qty => 10)
Salesmenu.create(:bill_id => 1, :menu_id => 2, :qty => 20)
Salesmenu.create(:bill_id => 2, :menu_id => 1, :qty => 30)
Salesmenu.create(:bill_id => 2, :menu_id => 2, :qty => 40)

#--------------------------------------------------------------------------