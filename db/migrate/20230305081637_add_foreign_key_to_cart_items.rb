class AddForeignKeyToCartItems < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :cart_items, :items, column: :item_id, on_update: :cascade, on_delete: :cascade 
  end
end
