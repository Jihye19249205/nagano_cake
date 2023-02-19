class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    # @item.genre_id = genre_id
    if @item.save
      redirect_to admin_item_path(@item.id)
      flash[:notice] = "商品登録が完了しました"
    # else
    #   render "/admin/items"
    end
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @genre = @item.genre
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "商品情報が更新されました"
      redirect_to edit_admin_item_path(@item.id)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :genre, :image)
  end

end
