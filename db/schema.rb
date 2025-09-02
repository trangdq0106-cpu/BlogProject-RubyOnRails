# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_02_16_134246) do
  create_table "blogs", charset: "utf8mb4", force: :cascade do |t|
    t.string "title"
    t.text "shortdescription"
    t.text "description"
    t.boolean "published"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "comment_id"
    t.index ["comment_id"], name: "index_blogs_on_comment_id"
  end

  create_table "comments", charset: "utf8mb4", force: :cascade do |t|
    t.string "Name"
    t.text "comment"
    t.bigint "blog_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blog_id"], name: "index_comments_on_blog_id"
  end

  add_foreign_key "comments", "blogs"
end
