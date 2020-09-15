class DropTableBeercomments < ActiveRecord::Migration[6.0]
  def change
    drop_table :beercomments do |t|
      t.string "beercomment"
      t.integer "user_id", null: false
      t.integer "beer_id", null: false
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.index ["beer_id"], name: "index_beercomments_on_beer_id"
      t.index ["user_id"], name: "index_beercomments_on_user_id"
    end
  end
end
