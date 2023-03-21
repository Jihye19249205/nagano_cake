class Public::ItemsController < ApplicationController
  layout 'header_public'

  def index
    @items = Item.all
  end

  def show
    @cart_item = CartItem.new
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :genre_id, :price, :image)
  end

end
