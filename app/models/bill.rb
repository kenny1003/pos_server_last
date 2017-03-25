class Bill < ActiveRecord::Base
  belongs_to :store

  belongs_to :workperiod
  has_many :salesmenu


end
