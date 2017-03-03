class RegionsController < ApplicationController

	# include GeoKit::Geocoders

	def beginScrapeProcess
		data = Region.scrapeMinDat()
		render :json => data
	end

	def addLongAndLatToRegions
		results = nil
		Region.where('id > 100') do |region|
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
		Region.all.each do |x|
			subData = []
			Mineral.where(region_id: x.id).each do |mineral|
				subData.push(mineral.name)	
			end
			data.push(x.name => subData)
		end
		render :json => data
	end
end