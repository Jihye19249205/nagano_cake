class Item < ApplicationRecord

  belongs_to :genre, optional: true
  has_one_attached :image
  has_many :cart_items, dependent: :destroy
  has_many :order_details

  validates :genre_id, :name, :introduction, :price, presence: true

  def add_tax_price
     (price * 1.1).floor
  end
end
