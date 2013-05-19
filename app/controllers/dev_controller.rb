class DevController < ApplicationController
	@@app_id = 191338297661848
	@@app_secret = "e218f0abdb012a0fc8c49e135b8af61d"
	@@fb_redirect_url = "http://launchp.herokuapp.com/dev/resp"

	def resp
		code = params[:code]
		#TODO: validation (code)

		# Exchange code for an access token
		url = "https://graph.facebook.com/oauth/access_token?client_id=#{@@app_id}&client_secret=#{@@app_secret}&code=#{code}&redirect_uri=#{@@fb_redirect_url}"
		token = makeHttpsGetRequest url
		token = token[token.index("access_token")+13, token.index("expires")-2]
		#TODO: validation (token)
		
		# Get stuff about the user
		url = "https://graph.facebook.com/me?access_token=#{token}"
		@result = makeHttpsGetRequest url		
	end
	
	# Redirect to Facebook sign up/in page with our credentials.
	# Reponse url: our url to handle Facebook's callback
	def facebook
		url = "https://www.facebook.com/dialog/oauth?client_id=#{@@app_id}&redirect_uri=#{@@fb_redirect_url}"
		redirect_to url
	end
	
	def user
	
	end
	
	def userCallback
	
	end
	
	private
	def makeHttpsGetRequest(url)
		require 'net/https'
		require 'net/http'
		require 'uri'
		
		uri = URI.parse(url)
		http = Net::HTTP.new(uri.host, uri.port)
		http.use_ssl = true
		http.verify_mode = OpenSSL::SSL::VERIFY_NONE

		request = Net::HTTP::Get.new(uri.request_uri)
		http.request(request).body
	end
	
end