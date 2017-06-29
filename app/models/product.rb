class Product < ApplicationRecord
  belongs_to :seller

  validates_presence_of :name, :price
end
