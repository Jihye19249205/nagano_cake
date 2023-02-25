class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|

      # ジャンルid
      t.integer :genre_id, null: false
      # 商品名
      t.string :name, null: false, unique: true
      # 商品説明文
      t.text :introduction, null: false
      # 税抜価格
      t.integer :price, null: false
      # 販売ステータス
      t.boolean :is_active, null: false, default: "TRUE"
      # 登録日時、更新日時
      t.timestamps null: false
    end

    

  end
end
