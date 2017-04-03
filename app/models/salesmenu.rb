class Salesmenu < ActiveRecord::Base
  belongs_to :menu
  #has_one :menu
  belongs_to :bill
end
