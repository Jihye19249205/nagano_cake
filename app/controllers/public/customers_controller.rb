class Public::CustomersController < ApplicationController
  layout 'header_public'
  
  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update
    redirect_to customer_path(@customer)
  end

  def confirm_withdraw
  end

  def withdraw
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :address, :telephone_number, :email)
  end

end
