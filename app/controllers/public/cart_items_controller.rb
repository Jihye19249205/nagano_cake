class Public::CartItemsController < ApplicationController
  layout 'header_public'
  before_action :authenticate_customer!

  def index
    @cart_items = CartItem.where(customer:current_customer)
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @previous_cart_item = CartItem.find_by(item: @cart_item.item)
    if @previous_cart_item.present? and @cart_item.valid?
       @cart_item.amount += @previous_cart_item.amount
       @previous_cart_item.destroy
    end
    if @cart_item.save!
      redirect_to cart_items_path
    else
      render "items/show"
    end

  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(amount: params[:cart_item][:amount].to_i)
    @cart_item.save
    redirect_to cart_items_path
  end

  


  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    flash[:notice] = "カート内商品を全て削除しました。"
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount, :image)
  end

end
