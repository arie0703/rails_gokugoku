# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_10_140914) do

  create_table "beercomments", force: :cascade do |t|
    t.string "beercomment"
    t.integer "user_id", null: false
    t.integer "beer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["beer_id"], name: "index_beercomments_on_beer_id"
    t.index ["user_id"], name: "index_beercomments_on_user_id"
  end

  create_table "beerlikes", force: :cascade do |t|
    t.integer "beer_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["beer_id"], name: "index_beerlikes_on_beer_id"
    t.index ["user_id"], name: "index_beerlikes_on_user_id"
  end

  create_table "beers", force: :cascade do |t|
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

  create_table "comments", force: :cascade do |t|
    t.string "comment"
    t.integer "user_id", null: false
    t.integer "post_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "foodcomments", force: :cascade do |t|
    t.string "foodcomment"
    t.integer "user_id", null: false
    t.integer "food_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["food_id"], name: "index_foodcomments_on_food_id"
    t.index ["user_id"], name: "index_foodcomments_on_user_id"
  end

  create_table "foodlikes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "food_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["food_id"], name: "index_foodlikes_on_food_id"
    t.index ["user_id"], name: "index_foodlikes_on_user_id"
  end

  create_table "foods", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "body"
    t.string "title"
    t.string "image"
    t.integer "user_id"
  end

  create_table "highballs", force: :cascade do |t|
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

  create_table "highcomments", force: :cascade do |t|
    t.string "highcomment"
    t.integer "user_id", null: false
    t.integer "highball_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["highball_id"], name: "index_highcomments_on_highball_id"
    t.index ["user_id"], name: "index_highcomments_on_user_id"
  end

  create_table "highlikes", force: :cascade do |t|
    t.integer "highball_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["highball_id"], name: "index_highlikes_on_highball_id"
    t.index ["user_id"], name: "index_highlikes_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "post_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_likes_on_post_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "body"
    t.integer "user_id"
    t.string "image"
    t.string "title"
    t.string "maker"
    t.string "product"
    t.float "rate"
    t.string "alcohol"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.text "profile"
    t.string "image"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "beercomments", "beers"
  add_foreign_key "beercomments", "users"
  add_foreign_key "beerlikes", "beers"
  add_foreign_key "beerlikes", "users"
  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "foodcomments", "foods"
  add_foreign_key "foodcomments", "users"
  add_foreign_key "foodlikes", "foods"
  add_foreign_key "foodlikes", "users"
  add_foreign_key "highcomments", "highballs"
  add_foreign_key "highcomments", "users"
  add_foreign_key "highlikes", "highballs"
  add_foreign_key "highlikes", "users"
  add_foreign_key "likes", "posts"
  add_foreign_key "likes", "users"
end
