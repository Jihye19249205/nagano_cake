class AddForeignKeyToOrders < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :orders, :customers, column: :customer_id, on_update: :cascade, on_delete: :cascade
  end
end
