class Admin::HomesController < ApplicationController
  # before_action :authenticate_admin!

  def top
    @orders, @selected = get_orders(params)
  end

  private

  def get_orders(params)
    if !params[:status].present? || !Order.statuses.keys.to_a.include?(params[:status])
      return [Order.latest,'all']
    end

    get_by_enum_value(params[:status])

  end

  def get_by_enum_value(status)
    case status
    when 'wait_payment'
      [Order.latest.wait_payment, 'wait_payment']
    when 'confirm_payment'
      [Order.latest.confirm_payment, 'confirm_payment']
    when 'making'
      [Order.latest.making, 'making']
    when 'prepairing_shipping'
      [Order.latest.prepairing_shipping, 'prepairing_shipping']
    when 'shipped'
      [Order.latest.shipped, 'shipped']
    end
  end

  def total_orders(orders)
    orders.count
  end

end
