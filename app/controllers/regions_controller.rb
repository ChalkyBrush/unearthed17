class RegionsController < ApplicationController
	def beginScrapeProcess
		data = Region.scrapeMinDat()
		render :json => data
	end
end