class Order < ApplicationRecord

  enum status: { wait_payment: 0, confirm_payment: 1, making: 2, preparing_shipping: 3, shipped: 4}
  belongs_to :customer
  has_many :order_details, dependent: :destroy

  validates :customer_id, :address, :name, :postal_code, :shipping_fee, :total_payment, :payment_way, presence: true

  scope :wait_payment, -> { where(status: 'wait_payment') }
  scope :confirm_payment, -> { where(status: 'confirm_payment') }
  scope :making, -> { where(status: 'making') }
  scope :prepairing_shipping, -> { where(status: 'prepairing_shipping') }
  scope :shipped, -> { where(status: 'shipped') }

  enum payment_way: { credit_card: 0, transfer: 1 }

end
