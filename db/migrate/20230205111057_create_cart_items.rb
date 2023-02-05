class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      # 商品券id
      t.integer :item_id, null: false
      # 数量
      t.integer :amount, null: false
      # 登録日時、更新日時
      t.timestamps null: false
    end
  end
end
