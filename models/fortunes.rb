require 'nokogiri'
require 'open-uri'
require 'pry'
class Fortune

	attr_accessor :fortunes

	def initialize 
		fortunesdoc = open("http://joshmadison.com/2008/04/20/fortune-cookie-fortunes/")
		@fortunes_nokogiri = Nokogiri::HTML(fortunesdoc)
		@fortunes = []
	end 

	def scrape_fortunes
		
		@fortunes_nokogiri.css("ul")[2].children.each do |fortune| 
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

	def random_fortune
		@fortunes.sample
	end 
		
 



end 
