class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end
  
  def update
    @order = Order.find(params[:id])
  end
  
  private
  
  # def order_params
  #   params.require(:order).permit(:)
  # end
  
end
