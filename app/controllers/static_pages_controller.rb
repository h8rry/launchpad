class StaticPagesController < ApplicationController
	def home



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