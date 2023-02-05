class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      # 注文id
      t.integer :order_id, null: false, unique: true
      # 商品id
      t.integer :item_id, null: false
      # 税込単価
      t.integer :unit_price, null: false
      # 数量
      t.integer :amount, null: false
      # 製作ステータス
      t.integer :making_status, null: false, default: 0
      # 登録日時、更新日時
      t.timestamps null: false
    end
  end
end
