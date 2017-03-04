# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170304031137) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "drillings", force: :cascade do |t|
    t.integer  "region_id"
    t.string   "coordinate_x"
    t.string   "coordinate_y"
    t.integer  "from"
    t.integer  "to"
    t.integer  "interval"
    t.string   "gold"
    t.integer  "depth"
    t.string   "drill_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "example_mines", force: :cascade do |t|
    t.string   "mine_name"
    t.integer  "number_reg_actions"
    t.integer  "fines_paid"
    t.integer  "chemical_spills_second_level"
    t.integer  "chemical_spills_escaping_property"
    t.integer  "chemically_related_wildlife_mortalities"
    t.integer  "energy_consumption_gj_purchased"
    t.integer  "energy_consumption_gj_direct"
    t.integer  "energy_consumption_mj_per_tonne_processed"
    t.integer  "greenhouse_gas_direct"
    t.integer  "greenhouse_gas_indrect"
    t.integer  "greenhouse_gas_kg_per_tonne_ore"
    t.integer  "nox_emissions_kg"
    t.integer  "sox_emssions_kg"
    t.integer  "pm10_emissions_kg"
    t.integer  "mercury_air_emissions_kg"
    t.integer  "water_consumed"
    t.integer  "water_consumption_l_per_tonne_ore"
    t.integer  "water_dischaged"
    t.integer  "cyanide_used_tonnes"
    t.integer  "explosives_used_tonnes"
    t.integer  "nitric_acid_used_liters"
    t.integer  "copper_sulfate_used_tonnes"
    t.integer  "caustic_used_tonnes"
    t.integer  "lime_used_tonnes"
    t.integer  "grinding_media_used_tonnes"
    t.integer  "chlorine_used_liters"
    t.integer  "antifreeze_used_liters"
    t.integer  "lubricating_oil_used_liters"
    t.integer  "tires_used_tonnes"
    t.integer  "scrap_metal_recycled_tonnes"
    t.integer  "used_oil_recycled_litres"
    t.integer  "other_waste_recycled_kg"
    t.integer  "non_hazardous_solid_waste_dispol_kg"
    t.integer  "hazardous_liquid_waste_disposal_liters"
    t.integer  "ore_processed_tonnes"
    t.integer  "tailings_material_stored_tonnes"
    t.integer  "waste_rock_stored_tonnes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "minerals", force: :cascade do |t|
    t.string  "name"
    t.integer "region_id"
  end

  add_index "minerals", ["region_id"], name: "index_minerals_on_region_id", using: :btree

  create_table "regions", force: :cascade do |t|
    t.string   "name"
    t.string   "coordinateX"
    t.string   "coordinateY"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "coordinateX_SW"
    t.string   "coordinateX_NE"
    t.string   "coordinateY_SW"
    t.string   "coordinateY_NE"
  end

end
