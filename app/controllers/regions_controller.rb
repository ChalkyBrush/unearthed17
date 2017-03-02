class RegionsController < ApplicationController
	def beginScrapeProcess
		data = Region.scrapeMinDat()
		render :json => data
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