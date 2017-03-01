class ExampleMinesController < ApplicationController

	def view_data
		csv = ExampleMine.readCSVandStore()
		displayData = []
		argentina2 = []
		australia = []
		canada = []
		chile2 = []
		dominicanRepublic = []
		papuaNewGuinea = []
		peru = []
		saudiArabia4 = []
		unitedStates = []
		zambia5 = []
		titleTable = []
		csv.each do |row|
		  rowData = row.to_hash
		  if rowData.values[1] == "Argentina2"
		  	argentina2.push(rowData.values[0])
		  elsif rowData.values[1] == "Australia"
		  	australia.push(rowData.values[0])
		  elsif rowData.values[1] == "Canada"
		  	canada.push(rowData.values[0])
		  elsif rowData.values[1] == "Chile2"
		  	chile2.push(rowData.values[0])
		  elsif rowData.values[1] == "Dominican Republic3"
		  	dominicanRepublic.push(rowData.values[0])
		  elsif rowData.values[1] == "Papua New Guinea"
		  	papuaNewGuinea.push(rowData.values[0])
		  elsif rowData.values[1] == "Peru"
		  	peru.push(rowData.values[0])
		  elsif rowData.values[1] == "Saudi Arabia4"
		  	saudiArabia4.push(rowData.values[0])
		  elsif rowData.values[1] == "United States"
		  	australia.push(rowData.values[0])
		  elsif rowData.values[1] == "Zambia5"
		  	zambia5.push(rowData.values[0])
		  end
		  displayData.push(rowData)
		end
		newDisplayData = {"Argentina2" => argentina2, "Australia" => australia, "Canada" => canada,
			"Chile2" => chile2, "Dominican Republic3" => dominicanRepublic, "Papua New Guinea" => papuaNewGuinea,
			"Peru" => peru, "Saudi Arabia4" => saudiArabia4, "Australia" => australia, "Zambia5" => zambia5}
		render :json => newDisplayData
	end

	

	def shapefileTest
		RGeo::Shapefile::Reader.open("app/assets/shapefiles/nevada.shp", {:assume_inner_follows_outer => true}) do |file|
		  puts "File contains #{file.num_records} records."
		  displayData = []
		  file.each do |record|
		  	recordHash = {"Index" => record.index, "Geometry" => record.geometry.as_text, "Attributes" => record.attributes.inspect}
		  	displayData.push(recordHash)
		  end

		end
		render :json => displayData
	end

end
