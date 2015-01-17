require 'nokogiri'
require 'open-uri'

fortunesdoc = open("http://joshmadison.com/2008/04/20/fortune-cookie-fortunes/")

fortunes = Nokogiri::HTML(fortunesdoc)

#gives an array of all the fortunes
fortunes.css(".col-md-12 ul li")

#a specific fortune

fortunes.css(".col-md-12 ul li")[0 + rand(303)].children.text