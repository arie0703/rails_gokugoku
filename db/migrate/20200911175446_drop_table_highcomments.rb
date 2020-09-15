class DropTableHighcomments < ActiveRecord::Migration[6.0]
  def change
    drop_table :highcomments do |t|
      t.string "highcomment"
      t.integer "user_id", null: false
      t.integer "highball_id", null: false
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.index ["highball_id"], name: "index_highcomments_on_highball_id"
      t.index ["user_id"], name: "index_highcomments_on_user_id"
    end
  end
end
