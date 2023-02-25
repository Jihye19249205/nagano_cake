class AddForeignKeyToItems < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :items, :genres, column: :genre_id, on_update: :cascade, on_delete: :cascade
  end
end
