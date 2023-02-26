class Admin::OrderDetailsController < ApplicationController
  
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = Order.find(order_detail_params)
  end
  
  private
  
  def order_detail_params
    
  end
  
end
