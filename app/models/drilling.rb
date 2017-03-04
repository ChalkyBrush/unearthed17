class Drilling < ActiveRecord::Base
	def self.parseKML
		path = "app/assets/drill-locations.kml"
		doc = Nokogiri::HTML(File.open(path))

		# doc = Nokogiri::HTML(open('https://www.mindat.org/loc-638.html'))
		# data = []

		# search = 0
		titleArray = []
		title = nil
		doc.search('strong').each do |link|
			title = link.content
			titleArray.push(title)
		end
		dataHash = {}
		doc.css('.intercept').each_with_index do |link, index|
			if link.content!=nil
				tableData = link.content.gsub(' ', "")
				tableData = tableData.split( /\r?\n/ )
				# tableData.inspect
				# puts tableData
				actualData = {}
				countIndex = 0
				tableData.each do |x|
					if x == ""
					else
						if countIndex == 0
							actualData["from"] = x
							countIndex = countIndex + 1
						elsif countIndex == 1
							actualData["to"] = x
							countIndex = countIndex + 1
						elsif countIndex == 2
							actualData["interval"] = x
							countIndex = countIndex + 1
						elsif countIndex == 3
							actualData["gold"] = x
							countIndex = countIndex + 1						
						end
					end
				end
				dataHash[titleArray[index]] = actualData
			end
		end
		doc.search('coordinates').each_with_index do |link, index|
			coordinateData = link.content.split(",")
			coordinateHash = {}
			coordinateHash["lng"] = coordinateData[0]
			coordinateHash["lat"] = coordinateData[1]
			dataHash[titleArray[index]]["coordinates"] = coordinateHash
		end
		doc.search('td').each_with_index do |link, index|
			if link.content!=nil
				tableString = link.content
				puts tableString
				str1_markerstring = "Depth:"
				str2_markerstring = " "

				depth = tableString[/#{str1_markerstring}(.*?)#{str2_markerstring}/m, 1]
				if depth == nil
					str2_markerstring = "\n"
					depth = tableString[/#{str1_markerstring}(.*?)#{str2_markerstring}/m, 1]
				end
				if depth!=nil
					dataHash[titleArray[index]]["depth"] = depth.gsub("\n", "")
				else
					dataHash[titleArray[index]]["depth"] = 0
				end
			end
		end

# "TPD002"=>{"from"=>"43", "to"=>"60", "interval"=>"17", "gold"=>"2.08", "coordinates"=>{"coordinateX"=>"124.54799", "coordinateY"=>"-29.25245"}, "depth"=>0}, "TPD001"=>{"from"=>"83", "to"=>"95", "interval"=>"12", "gold"=>"1.07", "coordinates"=>{"coordinateX"=>"124.547167", "coordinateY"=>"-29.251784"}, "depth"=>0}, nil=>{"from"=>"67", "to"=>"73", "interval"=>"6", "gold"=>"2.04", "depth"=>0}}
		dataHash.each do |key, array|
		  if array!=nil
		  	  if array["coordinates"] != nil
				  Drilling.create!(drill_id: key, lng: array["coordinates"]["lng"], lat: array["coordinates"]["lat"], from: array["from"], to: array["to"], interval: array["interval"], gold: array["gold"], depth: array["depth"])
				  puts "#{key}-----"
				  puts array
			  end
		  end
		end		
		return dataHash
		# puts doc.xpath("//character")
	end
end