class Category < ActiveRecord::Base
  has_many :menu
  belongs_to :store
end
