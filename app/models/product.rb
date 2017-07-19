class Product < ApplicationRecord
  belongs_to :seller
  belongs_to :category

  has_many :orders
  has_many :buyers, through: :orders, source: :user

  validates_presence_of :name, :price
end
