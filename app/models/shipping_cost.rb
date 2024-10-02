class ShippingCost < ActiveHash::Base
  self.data = [
    { id: 1, name: '出品者負担' },
    { id: 2, name: '購入者負担' }
  ]

  include ActiveHash::Associations
  has_many :items
end