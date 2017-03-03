class Region < ActiveRecord::Base
	require 'nokogiri'
	require 'open-uri'


	def self.scrapeMinDat
		doc = Nokogiri::HTML(open('https://www.mindat.org/loc-638.html'))
		data = []

		search = 0
		doc.search('a', 'a').each do |link|
		  # puts link.content
		  if link.first[1].include? "loc-"
		  	if !link.first[1].include? "638"
		  		newRegion = nil
			  	data.push(link.first[1])
			  	if search < 10000000
			  		search = search + 1
			  		newData = []
			  		doc2 = Nokogiri::HTML(open('https://www.mindat.org/'+link.first[1]))
			  		getTitle = true
			  		doc2.search('h1').each do |link|
			  			if getTitle
			  				getTitle = false
			  				puts link.content
			  				newRegion = Region.create!(name: link.content)
			  			end
			  			# newData.push(link.content)
			  		end
			  		doc2.css('.lm').each do |link|
			  			# puts link.first
			  			newData.push(link.content)
			  			Mineral.create!(name: link.content, region_id: newRegion.id)
			  		end
			  		doc2.css('.lm1').each do |link|
			  			# puts link.first
			  			newData.push(link.content)
			  			Mineral.create!(name: link.content, region_id: newRegion.id)
			  		end
			  		data.push(newData)
			  	end
			 end
		  end
		end
		return data
	end
end