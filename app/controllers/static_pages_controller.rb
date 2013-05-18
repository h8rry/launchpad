class StaticPagesController < ApplicationController
	def home

		require "net/https"
		require "uri"

		url = "https://graph.facebook.com/oauth/access_token?client_id=191338297661848&redirect_uri=http://launchp.herokuapp.com/fb&client_secret=e218f0abdb012a0fc8c49e135b8af61d&code=AQAatiJg5FwG3chuzsQoR9ImsXiYEmINXgo8nR3tqgOXaW8QPav0KhqJyOpYS5qPqQycz9069PRvbn7GfQcc4Xkkp4qHKh7XQ7MlkfcQv6t2OCbmUZL4rMKNx8PtT6Gq0lps1It7s5HRx-qstzs4sQlAjkYivS2gY3vAMqaUvSrmiWnUZIbdnlogKdTsQKu3o4A_loPujIn2WVPgzxSr0Hbh2sWV-Ck6ZuB524fYZl1rBDoysYDcdhdCmpA-LPhB2zBpMyEU-ib2E-W8Fx46hdZtfxZQYXMDVIccsBsXF0FuljDhHfadh25hQgJV3ynQ6KI#_=_"

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

		url = "https://graph.facebook.com/oauth/access_token?client_id=191338297661848&redirect_uri=http://launchp.herokuapp.com/fb&client_secret=e218f0abdb012a0fc8c49e135b8af61d&code=" + params[:code]

		uri = URI.parse(url)
		http = Net::HTTP.new(uri.host, uri.port)
		http.use_ssl = true
		http.verify_mode = OpenSSL::SSL::VERIFY_NONE

		request = Net::HTTP::Get.new(uri.request_uri)

		@response = http.request(request)

	end
end