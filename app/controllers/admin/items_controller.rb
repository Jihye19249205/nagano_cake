class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create

    @item = Item.new(item_params)
    if @item.save!
      redirect_to admin_items_path
      flash[:notice] = "商品登録が完了しました"
    else
      @items = Item.all
      render :index
    end
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    # @genre_id = @item.genre_id
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "商品情報が更新されました"
      redirect_to admin_item_path(@item)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :genre_id, :price, :image)
  end

end
