class DropTableHighlikes < ActiveRecord::Migration[6.0]
  def change
    drop_table :highlikes do |t|
      t.integer "highball_id", null: false
      t.integer "user_id", null: false
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.index ["highball_id"], name: "index_highlikes_on_highball_id"
      t.index ["user_id"], name: "index_highlikes_on_user_id"
    end
  end
end
