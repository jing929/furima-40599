class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :shopping_cost
  belongs_to :shopping_day
  belongs_to :user

  has_one_attached :image
  has_one :order
  
  validates :item_name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :category_id, presence: true, numericality: { other_than: 1, message: "Must be other than 1" }
  validates :condition_id, presence: true, numericality: { other_than: 1, message: "Must be other than 1" }
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "Must be other than 1" }
  validates :shopping_cost_id, presence: true, numericality: { other_than: 1, message: "Must be other than 1" }
  validates :shopping_day_id, presence: true, numericality: { other_than: 1, message: "Must be other than 1" }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, format: { with: /\A[0-9]+\z/ }
  validates :image, presence: true


end
