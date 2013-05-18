class StaticPagesController < ApplicationController
	def home

		require "net/https"
		require "uri"

		url = "https://graph.facebook.com/oauth/access_token?client_id=191338297661848&redirect_uri=http://launchp.herokuapp.com/&client_secret=e218f0abdb012a0fc8c49e135b8af61d&code=" + "AQBtXhqOpkb-iORsR9MByb3lfDiSw-rkcc-7x9TU_m2t292ipSmq6dfORw9HIjCBoBARjfzsAMHPO0-ZoOWH-qSeDk1JpxsTABEAKNCMT8YhJf9OhBcEwZEM34tK9OdXcfHOVN-rFgmqSWoZFoRUcgnSIc9IFs_gdqLP5SZoBGn3ufSGc7F-UKW7_mxtI0-ygMp6RbW_DNTzGYd9xXoJ-CnEdb8mQn9YUgKjKYzgScrVEZRk8n3Iz7Bd-NId0KquAN0m2jDxEGAIGC7X6Z-k0UxeciL0ghrGi0Pl84TjkJ3AbaLMaBn_p46-axOTALYzDrM#_=_"

		uri = URI.parse(url)
		http = Net::HTTP.new(uri.host, uri.port)
		http.use_ssl = true
		http.verify_mode = OpenSSL::SSL::VERIFY_NONE

		request = Net::HTTP::Get.new(uri.request_uri)

		@response = http.request(request)

	end

	def fb

		require "net/https"
		require "uri"

		url = 'https://www.facebook.com'

		uri = URI.parse(url)
		http = Net::HTTP.new(uri.host, uri.port)
		http.use_ssl = true
		http.verify_mode = OpenSSL::SSL::VERIFY_NONE

		request = Net::HTTP::Get.new(uri.request_uri)

		@response = http.request(request)

	end
end