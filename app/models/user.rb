class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, presence: true, format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]+\z/}
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/}
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/}
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ン一]+\z/}
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ン一]+\z/}
  validates :birthday, presence: true

  has_many :items, dependent: :destroy
  has_many :orders, dependent: :destroy
end
