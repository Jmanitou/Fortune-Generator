require 'bundler'
Bundler.require

require_relative 'models/fortunes.rb'
require_relative 'models/twilio.rb'

class MyApp < Sinatra::Base
	get "/" do
		erb :index
	end
	get "/page" do
	@fortune = Fortune.new
	@fortune.scrape_fortunes

		erb :page
	end 

	post "/sendtext" do
		puts params["number"]
		Text.new.send_text(params["number"])
	end


end 
