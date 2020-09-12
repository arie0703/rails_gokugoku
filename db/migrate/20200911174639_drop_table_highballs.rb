class DropTableHighballs < ActiveRecord::Migration[6.0]
  def change
    drop_table :highballs do |t|
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.text "body"
      t.string "title"
      t.string "product"
      t.string "maker"
      t.integer "rate"
      t.string "alcohol"
      t.string "image"
      t.integer "user_id"
    end
  end
end
