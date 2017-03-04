class CreateDrillings < ActiveRecord::Migration
  def change
    create_table :drillings do |t|
    	t.integer :region_id
    	t.string :lng
    	t.string :lat
    	t.integer :from
    	t.integer :to
    	t.integer :interval
    	t.string :gold
    	t.integer :depth
    	t.string :drill_id


    	t.timestamps
    end
  end
end
