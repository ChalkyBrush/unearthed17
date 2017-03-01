class CreateExampleMines < ActiveRecord::Migration
  def change
    create_table :example_mines do |t|
      t.string :mine_name
      t.integer :number_reg_actions
      t.integer :fines_paid
      t.integer :chemical_spills_second_level
      t.integer :chemical_spills_escaping_property
      t.integer :chemically_related_wildlife_mortalities
      t.integer :energy_consumption_gj_purchased
      t.integer :energy_consumption_gj_direct
      t.integer :energy_consumption_mj_per_tonne_processed
      t.integer :greenhouse_gas_direct
      t.integer :greenhouse_gas_indrect
      t.integer :greenhouse_gas_kg_per_tonne_ore
      t.integer :nox_emissions_kg
      t.integer :sox_emssions_kg
      t.integer :pm10_emissions_kg
      t.integer :mercury_air_emissions_kg
      t.integer :water_consumed
      t.integer :water_consumption_l_per_tonne_ore
      t.integer :water_dischaged
      t.integer :cyanide_used_tonnes
      t.integer :explosives_used_tonnes
      t.integer :nitric_acid_used_liters
      t.integer :copper_sulfate_used_tonnes
      t.integer :caustic_used_tonnes
      t.integer :lime_used_tonnes
      t.integer :grinding_media_used_tonnes
      t.integer :chlorine_used_liters
      t.integer :antifreeze_used_liters
      t.integer :lubricating_oil_used_liters
      t.integer :tires_used_tonnes
      t.integer :scrap_metal_recycled_tonnes
      t.integer :used_oil_recycled_litres
      t.integer :other_waste_recycled_kg
      t.integer	:non_hazardous_solid_waste_dispol_kg
      t.integer :hazardous_liquid_waste_disposal_liters
      t.integer :ore_processed_tonnes
      t.integer :tailings_material_stored_tonnes
      t.integer :waste_rock_stored_tonnes

      t.timestamps
    end
  end
end
