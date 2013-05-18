class StaticPagesController < ApplicationController
	def home

	end

	def fb

		
		require "net/https"
		require "uri"

		code = params[:code]

		url = "https://graph.facebook.com/oauth/access_token?client_id=191338297661848&redirect_uri=http://launchp.herokuapp.com/fb/&client_secret=e218f0abdb012a0fc8c49e135b8af61d&code=#{code}"

		uri = URI.parse(url)
		http = Net::HTTP.new(uri.host, uri.port)
		http.use_ssl = true
		http.verify_mode = OpenSSL::SSL::VERIFY_NONE

		request = Net::HTTP::Get.new(uri.request_uri)
		@response = http.request(request)

	end
end