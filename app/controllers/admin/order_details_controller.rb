class Admin::OrderDetailsController < ApplicationController
  before_adtion :authenticate_admin!
  layout 'header_admin'

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    @order = @order_detail.order

    # if @order_detail.making_statuses == "製作中"
    #   @order.update(status: 2)
    #   flash[:notice] = "製作ステータスを更新しました"
    #   @order.save
    # end
    # if @order.order_details.amount == @order.order_details.where(making_status: 3).amount
    #   @order.update(status: 3)
    #   flash[:notice] = "製作ステータスを更新しました"
    #   @order.save
    # end
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:order_id, :item_id, :unit_price, :amount)
  end

end
