class RegionsController < ApplicationController

	# include GeoKit::Geocoders

	def beginScrapeProcess
		data = Region.scrapeMinDat()
		render :json => data
	end

	def addLongAndLatToRegions
		results = nil
		Region.all.each do |region|
			name = region.name
			name = name.gsub('  ', "+").gsub(' ', "+").gsub(',',"")
			query = name
			url = "http://maps.googleapis.com/maps/api/geocode/json?address="+query+"&sensor=false"
			url = URI.encode(url)
			response = HTTParty.get(url)
			googleJSON = JSON.parse(response.body)
			# puts googleJSON
			# ["results"]["geometry"]
			results = googleJSON
			results.each do |key, array|
			  # puts "#{key}-----"
			  resultsDown = results[key]
			  if !resultsDown.is_a? String
				  resultsDown.each do |key, array|
				  	coordX = key["geometry"]["location"]["lat"]
				  	coordY = key["geometry"]["location"]["lng"]
				  	coordXNE = key["geometry"]["viewport"]["northeast"]["lat"]
				  	coordYNE = key["geometry"]["viewport"]["northeast"]["lng"]
				  	coordXSW = key["geometry"]["viewport"]["southwest"]["lat"]
				  	coordYSW = key["geometry"]["viewport"]["southwest"]["lng"]
				  	region.coordinateX = coordX
				  	region.coordinateY = coordY
				  	region.coordinateX_NE = coordXNE
				  	region.coordinateY_NE = coordYNE
				  	region.coordinateX_SW = coordXSW
				  	region.coordinateY_SW = coordYSW
				  	region.save!
				  end
			  end
			  # puts array
			end
			# puts results
		end
		render :json => results
	end

	def viewRegionData
		data = []
		Region.order("name ASC").each do |region|
			mineralsArray = []
			
			Mineral.where(region_id: region.id).each do |mineral|
				mineralsArray.push(mineral.name)	
			end
			subData = {"name" => region.namae, "minerals" => mineralsArray, "lat" => region.coordinateX, "lng" => region.coordinateY, "SWlat" => region.coordinateX_SW, "SWlng" => region.coordinateY_SW, "NElat" => region.coordinateX_NE, "NElng" => region.coordinateY_NE}
			data.push(subData)
		end
		render :json => data
	end

	def viewRegionData2d
		data = []
		uniqueMineralNames = Mineral.uniq.pluck(:name)
		puts data.count
		Region.order("name ASC").each do |region|
			# mineralsArray = []
			
			# Mineral.where(region_id: region.id).each do |mineral|
			# 	mineralsArray.push(mineral.name)	
			# end
			subData = {"name" => region.name, "lat" => region.coordinateX, "lng" => region.coordinateY, "SWlat" => region.coordinateX_SW, "SWlng" => region.coordinateY_SW, "NElat" => region.coordinateX_NE, "NElng" => region.coordinateY_NE}
			uniqueMineralNames.each do |mineral|
				if Mineral.where(region_id: region.id, name: mineral).count > 0 then
					subData[mineral] = 1
				else
					subData[mineral] = 0
				end
			end
			data.push(subData)
		end
		render :json => data
	end

	def viewDrillings
		data = {}
		Drilling.find_each do |x|
			data[x.drill_id.to_sym] = x
		end
		render :json => data
	end

	def viewSAprojects
		data = File.read("app/assets/ProjectSA_geojson.json")
		render :json => data
	end

	def viewConstructionProjects
		data = File.read("app/assets/PropertiesConstruction_geojson.json")
		render :json => data
	end

	def viewExplorationProjects
		data = File.read("app/assets/PropertiesExploration_geojson.json")
		render :json => data
	end

	def viewOperationProjects
		data = File.read("app/assets/PropertiesOperation_geojson.json")
		render :json => data
	end

	def viewStudyProjects
		data = File.read("app/assets/PropertiesStudy_geojson.json")
		render :json => data
	end

	def viewTargetProjects
		data = File.read("app/assets/PropertiesTarget_geojson.json")
		render :json => data
	end
end