class Admin::HomesController < ApplicationController
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
  
end
