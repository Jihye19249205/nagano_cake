class CreateGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres do |t|
      # ジャンル名
      t.string :name
      # 登録日時、更新日時
      t.timestamps null: false
    end
    add_foreign_key :genres, :items
  end
end
