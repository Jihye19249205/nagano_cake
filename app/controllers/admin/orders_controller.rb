class Admin::OrdersController < ApplicationController
  layout 'header_admin'
  before_action :authenticate_admin!

  def index
    @orders = Order.page(params[:page])
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    
    # @order_detail = @order.order_detail(params[:customer_id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    flash[:notice] = "注文履歴情報が更新されました"
    redirect_to admin_order_path(@order)
    # if @order.status == "入金確認"
    #   @order.order_details.each do |order_detail|
    #     order_detail.update(making_status: 1)
    #   end
    # end
    # if @order.status == "入金確認"
    #   @order.order_details.each do |order_detail|
    #     order_detail.update(making_status: 1)
  end

  private

  def order_params
    params.require(:order).permit(
      :payment_way,
      :postal_code,
      :address,
      :name,
      :shipping_fee,
      :customer_id
      )
  end
end