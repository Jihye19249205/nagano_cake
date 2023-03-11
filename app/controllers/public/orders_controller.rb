class Public::OrdersController < ApplicationController
  layout 'header_public'
  
  def new
    @order = Order.new
  end
  
  def create
  end

  def index
  end

  def show
  end
  
  def confirm_order
  end
  
  def complete
  end
  
end
