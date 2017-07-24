class Product < ApplicationRecord
  belongs_to :seller
  belongs_to :category

  has_many :orders
  has_many :buyers, through: :orders, source: :user

  validates_presence_of :name, :price

  scope :expensive, -> { where('price > 50') }
  scope :cheap, -> { where('price < 50') }
  scope :expensive_first, -> { order(price: :desc) }
  scope :cheaper_first, -> { order(price: :asc) }
  scope :latest_first, -> { order(created_at: :desc) }
  scope :oldest_first, -> { order(created_at: :asc) }
  scope :cheap_oldest, -> { cheap.oldest_first }
  scope :cheap_latest, -> { cheap.latest_first }
  scope :expensive_newest, -> { expensive.newest_first }

  def expensive_products
    where('price > 50')
  end
end
