class Public::HomesController < ApplicationController
  layout 'header_public'

  def top
    @items = Item.order('id DESC').limit(4)
  end

  def about
  end
end
