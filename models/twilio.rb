require_relative "fortunes.rb"
require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

class Text

	def initialize
		# put your own credentials here
		account_sid = 'ACed3ed813257f8acedfce46a695216257'
		auth_token = 'cb1dd832eda91ea39319fe6827f1650b'

		# set up a client to talk to the Twilio REST API
		@client = Twilio::REST::Client.new(account_sid, auth_token)

		# alternatively, you can preconfigure the client like so
		Twilio.configure do |config|
			config.account_sid = account_sid
			config.auth_token = auth_token
		end

		# and then you can create a new client without parameters
		@client = Twilio::REST::Client.new

		fortune = Fortune.new
		fortune.scrape_fortunes
		@body = fortune.random_fortune

	end

	def send_text
		@client.messages.create(
			from: '+14342605034',
			to: '+19174466098',
		  	body: @body
		)
	end
end

text_1 = Text.new
text_1.send_text

