class Menu < ActiveRecord::Base
  belongs_to :store
  belongs_to :category
  #has_many :salesmenu #하나의 메뉴는 여러번 팔릴 수 있으므로 has_many :salesmenu
                      #이를 참조할 때 User.find(1).bill.find(1).salesemenu.find(1).menu.name //팔린 메뉴이름이 나온다.
                      #has_many :salesmenu 관계를 설정 안해도 정상 작동함
end
