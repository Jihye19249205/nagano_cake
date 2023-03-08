class Public::CartItemsController < ApplicationController

  def index
    @cart_item = CartItem.new
    @cart_items = CartItem.all
    @item = Item.find(cart_item_params)
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    # @item = CartItem.find(params[:item_id])
    @cart_item.save!
    flash[:notice] = "カートに商品が追加されました"
    # @cart_items = CartItem.all
    redirect_to cart_items_path
  end

  def update
    @cart_item = CartItem.find(params[:id])
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
  end

  def destroy_all
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount, :item_image)
  end

end
