class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :item

  validates :item_id, :order_id, :unit_price, :amount, :making_status, presence: true

  enum making_status: { cannot_start: 0, waiting_for_making: 1, making: 2, finish_making: 3 }

end
