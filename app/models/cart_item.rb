class CartItem < ApplicationRecord

  belongs_to :item
  belongs_to :customer

  validates :customer_id, :item_id, :amount, presence: true
  validates :amount, numericality:{ only_integer: true }

  def sum_of_price
    item.add_tax_price * amount
  end

  def subtotal
    item.add_tax_price * amount
  end

end
