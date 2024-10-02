class Condition < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '新品・未使用' },
    { id: 3, name: '未使用に近い' },
    { id: 4, name: '使用感あり' }
  ]

  include ActiveHash::Associations
  has_many :items
  end