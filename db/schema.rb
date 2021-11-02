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

ActiveRecord::Schema.define(version: 2021_11_02_205856) do

  create_table "comments", force: :cascade do |t|
    t.string "comment_text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.integer "plot_id"
  end

  create_table "iestades", id: :string, force: :cascade do |t|
    t.string "iestades_nos"
    t.index ["id"], name: "iestades_id_uindex", unique: true
  end

  create_table "plots", force: :cascade do |t|
    t.string "plot_name"
    t.string "plot_country"
    t.datetime "plot_updated_time"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vacins", force: :cascade do |t|
    t.string "iestade_id"
    t.string "iest_nos"
    t.date "vacin_date"
    t.string "vacin_type"
    t.string "preparat"
    t.string "vacin_posms"
    t.integer "vacin_kartas_num"
    t.string "prep_daudz"
    t.string "vakcin_ievade"
    t.string "indik_vakcin"
    t.integer "pers_age"
    t.string "pers_dzimums"
    t.integer "pers_skaits"
    t.integer "user_id", default: 0
    t.index ["id"], name: "index_vacins_on_id"
  end

end
