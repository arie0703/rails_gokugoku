class DropTableBeerlikes < ActiveRecord::Migration[6.0]
  def change
    drop_table :beerlikes do |t|
      t.integer "beer_id", null: false
      t.integer "user_id", null: false
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.index ["beer_id"], name: "index_beerlikes_on_beer_id"
      t.index ["user_id"], name: "index_beerlikes_on_user_id"
    end
  end
end
