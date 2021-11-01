
ActiveRecord::Schema.define(version: 2021_10_30_223341) do

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
    t.integer "iest_kods"
    t.string "iest_nos"
    t.date "vacin_date"
    t.string "vacin_type"
    t.string "preparat"
    t.string "vacin_posms"
    t.integer "vacin_kartas_num"
    t.float "prep_daudz"
    t.string "vakcin_ievade"
    t.string "indik_vakcin"
    t.integer "pers_age"
    t.string "pers_dzimums"
    t.integer "pers_skaits"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_vacins_on_user_id"
  end

end
