class Item < ApplicationRecord

  belongs_to :genre, optional: true
  has_one_attached :image
  has_many :cart_items, dependent: :destroy

  def add_tax_price
    (self.price * 1.1).round
  end
end
