class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|

      # 会員id
      t.integer :customer_id, null: false
      # 宛名
      t.string :name, null: false, unique: true
      # 郵便番号
      t.string :postal_code, null: false
      # 住所
      t.string :address, null: false
      # 登録日時、更新日時
      t.timestamps null: false
    end
  end
end
