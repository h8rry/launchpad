class StaticPagesController < ApplicationController
	def home

	end

	def fb


		require "net/https"
		require "uri"

		code = params[:code]

		token_request = "https://graph.facebook.com/oauth/access_token?client_id=191338297661848&redirect_uri=http://launchp.herokuapp.com/fb/&client_secret=e218f0abdb012a0fc8c49e135b8af61d&code=#{code}"

		uri = URI.parse(token_request)
		http = Net::HTTP.new(uri.host, uri.port)
		http.use_ssl = true
		http.verify_mode = OpenSSL::SSL::VERIFY_NONE

		request = Net::HTTP::Get.new(uri.request_uri)
		token = http.request(request).body

		temp1 = token.index("access_token")
		temp2= token.index("expires")
		token = token[temp1+13..temp2-2]

		info_request = "https://graph.facebook.com/me?fields=id,name,email&access_token=#{token}" 

		uri = URI.parse(info_request)
		http = Net::HTTP.new(uri.host, uri.port)
		http.use_ssl = true
		http.verify_mode = OpenSSL::SSL::VERIFY_NONE

		request = Net::HTTP::Get.new(uri.request_uri)
		@info = http.request(request)

		redirect_to "their site/?name=&email="

	end
end