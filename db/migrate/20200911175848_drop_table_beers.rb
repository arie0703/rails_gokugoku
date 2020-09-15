class DropTableBeers < ActiveRecord::Migration[6.0]
  def change
    drop_table :beers do |t|
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.text "body"
      t.string "title"
      t.string "maker"
      t.string "product"
      t.string "alcohol"
      t.integer "rate"
      t.string "image"
      t.integer "user_id"
    end
  end
end
