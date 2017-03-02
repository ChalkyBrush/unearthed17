class Region < ActiveRecord::Base
	require 'nokogiri'
	require 'open-uri'

	def self.scrapeMinDat
		doc = Nokogiri::HTML(open('https://www.mindat.org/lsearch.php?from=nsearch&loc=chile'))
		data = []
		puts "### Search for nodes by css"
		doc.css('nav ul.menu li a', 'article h2').each do |link|
		  puts link.content
		  data.push(link.content)
		end

		puts "### Search for nodes by xpath"
		doc.xpath('//nav//ul//li/a', '//article//h2').each do |link|
		  puts link.content
		  data.push(link.content)
		end

		puts "### Or mix and match."
		doc.search('nav ul.menu li a', '//article//h2').each do |link|
		  puts link.content
		  data.push(link.content)
		end
		return data
	end
end