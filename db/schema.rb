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

ActiveRecord::Schema.define(version: 2019_12_23_010646) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "packages", force: :cascade do |t|
    t.string "tracking_number"
    t.string "carrier"
    t.bigint "parcel_id", null: false
    t.boolean "overweight"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "fedex_volumetric_weight"
    t.decimal "higher_label_weight"
    t.boolean "tag_processed", default: false
    t.index ["parcel_id"], name: "index_packages_on_parcel_id"
  end

  create_table "parcels", force: :cascade do |t|
    t.decimal "length"
    t.decimal "width"
    t.decimal "height"
    t.decimal "weight"
    t.string "distance_unit"
    t.string "mass_unit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "packages", "parcels"
end
