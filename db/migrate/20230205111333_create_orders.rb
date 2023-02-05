class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      # 会員id
      t.integer :customer_id, null: false, unique: true
      # 注文ステータス
      t.integer :status, null: false, default: 0
      # 配送先住所
      t.string :address, null: false
      # 配送先氏名
      t.string :name, null: false
      # 配送先郵便番号
      t.string :postal_code, null: false
      # 送料
      t.integer :shipping_fee, null: false
      # 請求金額合計
      t.integer :total_payment, null: false
      # 支払方法
      t.integer :payment_way, null: false, default: 0
      # 登録日時、更新日時
      t.timestamps null: false
    end
  end
end
