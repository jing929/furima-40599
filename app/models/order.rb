class Order < ApplicationRecord
  belongs_to :user
  has_one :address
  has_one :items
  has_one :user
end
