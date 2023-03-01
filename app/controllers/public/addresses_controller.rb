class Public::AddressesController < ApplicationController

  def index
    @addresses = Address.all
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.save
    flash[:notice] = "配送先が登録されました"
    redirect_to addresses_params
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(address_params)
  end

  def destroy
  end

  private

  def address_params
    params.require(:address).permit(:customer_id, :name, :postal_code, :address)
  end

end
