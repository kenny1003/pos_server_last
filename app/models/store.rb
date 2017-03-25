class Store < ActiveRecord::Base
  belongs_to :user
  has_many :bills
  has_many :workperiod

  has_one :menu

end
