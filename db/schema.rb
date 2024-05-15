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

ActiveRecord::Schema[7.1].define(version: 2024_05_10_235906) do
  create_table "acc", id: false, charset: "latin1", force: :cascade do |t|
    t.integer "id", default: 0, null: false, unsigned: true
    t.string "method", limit: 16, default: "", null: false
    t.string "from_tag", limit: 64, default: "", null: false
    t.string "to_tag", limit: 64, default: "", null: false
    t.string "callid", limit: 128, default: "", null: false
    t.string "sip_code", limit: 3, default: "", null: false
    t.string "sip_reason", limit: 32, default: "", null: false
    t.datetime "time", precision: nil, default: "1970-01-01 00:00:01", null: false
    t.string "src_ip", limit: 64, default: "", null: false
    t.string "dst_user", limit: 64, default: "", null: false
    t.string "dst_domain", limit: 128, default: "", null: false
    t.string "src_user", limit: 64, default: "", null: false
    t.string "src_domain", limit: 128, default: "", null: false
    t.string "dst_ouser", limit: 64, default: "", null: false
  end

  create_table "acc_cdrs", id: false, charset: "latin1", force: :cascade do |t|
    t.bigint "id", default: 0, null: false
    t.string "src_username", limit: 64, default: "", null: false
    t.string "src_domain", limit: 128, default: "", null: false
    t.string "dst_username", limit: 64, default: "", null: false
    t.string "dst_domain", limit: 128, default: "", null: false
    t.string "dst_ousername", limit: 64, default: "", null: false
    t.datetime "start_time", precision: nil, default: "2000-01-01 00:00:01", null: false
    t.datetime "end_time", precision: nil, default: "2000-01-01 00:00:01", null: false
    t.integer "duration", default: 0, null: false, unsigned: true
    t.string "sip_call_id", limit: 128, default: "", null: false
    t.string "sip_from_tag", limit: 128, default: "", null: false
    t.string "sip_to_tag", limit: 128, default: "", null: false
    t.string "src_ip", limit: 64, default: "", null: false
    t.integer "cost", default: 0, null: false
    t.integer "rated", default: 0, null: false
    t.datetime "created", precision: nil, default: "2000-01-01 00:00:01", null: false
    t.integer "customer_id", default: 0, null: false
  end

  create_table "carrier_trusted", id: false, charset: "latin1", force: :cascade do |t|
    t.integer "id", limit: 1, null: false
    t.integer "src_ip", limit: 1, null: false
    t.integer "proto", limit: 1, null: false
    t.integer "from_pattern", limit: 1, null: false
    t.integer "tag", limit: 1, null: false
  end

  create_table "carriers", id: false, charset: "latin1", force: :cascade do |t|
    t.integer "id", default: 0, null: false
    t.string "name", collation: "utf8_unicode_ci"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "prefix", collation: "utf8_unicode_ci"
    t.string "intl_prefix", collation: "utf8_unicode_ci"
  end

  create_table "db_aliases", id: false, charset: "latin1", force: :cascade do |t|
    t.integer "id", default: 0, null: false, unsigned: true
    t.string "alias_username", limit: 64, default: "", null: false
    t.string "alias_domain", limit: 64, default: "", null: false
    t.string "username", limit: 64, default: "", null: false
    t.string "domain", limit: 64, default: "", null: false
  end

  create_table "domains", charset: "latin1", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entities", charset: "latin1", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "street_address"
    t.string "street_address_2"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.integer "entity_group"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "numbers", id: false, charset: "latin1", force: :cascade do |t|
    t.integer "id", default: 0, null: false
    t.integer "customer_id"
    t.string "number"
    t.string "name"
    t.integer "country_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.integer "voip_device_id"
    t.integer "route_id"
    t.integer "sub_route_id"
    t.integer "carrier_id"
    t.integer "included_minutes", default: 0
    t.boolean "redirected", default: false
    t.string "redirected_to"
  end

  create_table "subscribers", charset: "latin1", force: :cascade do |t|
    t.string "username"
    t.string "domain"
    t.string "password"
    t.string "ha1"
    t.string "ha1b"
    t.string "rpid"
    t.string "display_name"
    t.integer "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "version", id: false, charset: "latin1", force: :cascade do |t|
    t.integer "id", default: 0, null: false
    t.string "table_name", null: false, collation: "utf8_unicode_ci"
    t.integer "table_version", default: 0, null: false
  end

  create_table "voip_trunks", charset: "latin1", force: :cascade do |t|
    t.string "name"
    t.string "host"
    t.string "tag"
    t.integer "entity_id"
    t.integer "entity_group"
    t.integer "mask"
    t.integer "port"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
