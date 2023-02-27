class Admin::OrdersController < ApplicationController
  # before_action :authenticate_admin!
  before_action :set_order

  def show
  end

  def update
    @order.update
    flash[:notice] = "注文履歴情報が更新されました"
    redirect_to
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:status)
  end

end
