class AddCornersToRegions < ActiveRecord::Migration
  def change
  	  	add_column :regions, :coordinateX_SW, :string
  	  	add_column :regions, :coordinateX_NE, :string
  	  	add_column :regions, :coordinateY_SW, :string
  	  	add_column :regions, :coordinateY_NE, :string
  end
end
