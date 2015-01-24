require 'bundler'
Bundler.require

require_relative 'models/fortunes.rb'

class MyApp < Sinatra::Base
	get "/" do
		erb :index
	end
	get "/page" do
	@fortune =	Fortune.new
	@fortune.scrape_fortunes

		erb :page
	end 
end 
