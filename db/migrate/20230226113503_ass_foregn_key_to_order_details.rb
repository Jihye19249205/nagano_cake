class AssForegnKeyToOrderDetails < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :order_details, :orders, column: :order_id, on_update: :cascade, on_delete: :cascade
    add_foreign_key :order_details, :items, column: :item_id, on_update: :cascade, on_delete: :cascade
  end
end
