class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @orders = Order.all
  end

  def show
    
  end

  def update
    @order.update
    flash[:notice] = "注文履歴情報が更新されました"
    redirect_to
  end

  private

  def order_params
    params.require(:order).permit(
      :status,
      :payment_way,
      :postal_code,
      :address,
      :name,
      :shipping_fee,
      :created_at)
  end

end
