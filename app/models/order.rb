class Order < ApplicationRecord

  enum status: { wait_payment: 0, confirm_payment: 1, making: 2, preparing_shipping: 3, shipped: 4}
  enum payment_way: { credit_card: 0, transfer: 1 }

end
