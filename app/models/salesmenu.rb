class Salesmenu < ActiveRecord::Base
  belongs_to :menu
  belongs_to :bill
end
