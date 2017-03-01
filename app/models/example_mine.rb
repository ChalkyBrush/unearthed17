class ExampleMine < ActiveRecord::Base

require 'csv'

 def self.readCSVandStore
 	path = "/assets/esg-data.csv"
 	path = "app/assets/esg-data.csv"
	csv_text = File.read(path)
	csv = CSV.parse(csv_text, :headers => true)
	p csv
	return csv
	# csv.each do |row|
	#   p row.to_hash
	# end
 end

end
