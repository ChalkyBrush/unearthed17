class CreateRegionsAndMinerals < ActiveRecord::Migration
  def change
    create_table :regions do |t|
			t.string :name
			t.string :coordinateX
			t.string :coordinateY

			t.timestamps
	    end
  
	    create_table :minerals do |t|
	    	t.string :name
	    	t.integer :region_id
	    end

    	add_index :minerals, :region_id
  end
end
