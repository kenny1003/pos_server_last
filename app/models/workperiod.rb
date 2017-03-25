class Workperiod < ActiveRecord::Base
  belongs_to :store
  has_many :bill
end
