class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update
    flash[:notice] = "注文履歴情報が更新されました"
    redirect_to 
  end

  private

  def order_params
    params.require(:order).permit(:status, :customer_id)
  end

end
