class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
    @genres = Genre.all
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :genre_id, :price, :image)
  end

end
