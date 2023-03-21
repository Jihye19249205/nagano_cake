class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  layout 'header_public'

  def new
    @addresses = current_customer.addresses
    @address = Address.new
    @order = Order.new
  end

  def confirm_order
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    if params[:order][:select_address] == "0"
      @order.address = current_customer.address
      @order.postal_code = current_customer.postal_code
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:select_address] == "1"
        @order.address = Address.find(params[:order][:address_id]).address
        @order.postal_code = Address.find(params[:order][:address_id]).postal_code
        @order.name = Address.find(params[:order][:address_id]).name
    elsif params[:order][:select_address] == "2"
      @new_address = current_customer.addresses.new(address_params)
    end
    @item_total = @cart_items.inject(0){ |sum, item| sum + item.sum_of_price }
    @total_payment = @item_total + @order.shipping_fee
  end

  def create
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    if @order.save!
      @cart_items.each do |cart_item|
        @order_detail = OrderDetail.new
        @order_detail.item_id = cart_item.item_id
        @order_detail.order_id = @order.id
        @order_detail.amount = cart_item.amount
        @order_detail.unit_price = cart_item.item.add_tax_price
        @order_detail.save!
      end
      redirect_to order_complete_orders_path
      @cart_items.destroy_all
    else
      render :new
    end
  end

  def order_complete
  end

  def index
    @orders = current_customer.orders
  end

  def show
     @order = Order.find(params[:id])
     @order_details = @order.order_details.all
  end

  private

  def order_params
    params.require(:order).permit(
      :customer_id,
      :payment_way,
      :postal_code,
      :address,
      :name,
      :total_payment)
  end

  def address_params
    params.require(:order).permit(:postal_code, :address, :name)
  end

end
