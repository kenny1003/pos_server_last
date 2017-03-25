class Store < ActiveRecord::Base
  belongs_to :user
  has_many :bill
  has_many :workperiod

end
