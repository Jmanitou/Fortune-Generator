require 'nokogiri'
require 'open-uri'

class Fortune

	attr_accessor :fortunes

	def initialize 
		fortunesdoc = open("http://joshmadison.com/2008/04/20/fortune-cookie-fortunes/")
		@fortunes_nokogiri = Nokogiri::HTML(fortunesdoc)
		@fortunes = []
	end 

	def scrape_fortunes
		@fortunes_nokogiri.css(".col-md-12 ul li").each do |fortune|
			@fortunes << fortune.children.text
		end
	end

	def clean_up_fortunes
		@fortunes.each do |fortune|
			if fortune.include?("says:")
				@fortunes.delete(fortune)
			end
		end 

	end

end 

newfortune = Fortune.new 
newfortune.scrape_fortunes
newfortune.clean_up_fortunes
puts newfortune.fortunes 