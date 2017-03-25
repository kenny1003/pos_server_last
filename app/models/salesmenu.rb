class Salesmenu < ActiveRecord::Base
  has_one :menu
  belongs_to :bill
end
