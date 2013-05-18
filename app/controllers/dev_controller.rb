class DevController < ApplicationController
	@@client_id = 191338297661848
	@@fb_redirect_url = "http://launchp.herokuapp.com/dev/resp"
		
	def index
		@url = "https://www.facebook.com/dialog/oauth?client_id=#{@@client_id}&redirect_uri=#{@@fb_redirect_url}"
	end

	def resp
		require 'net/http'
		require 'net/https'

		code = params[:code]
		
		path = "/oauth/access_token?client_id=#{@@client_id}&client_secret=#{code}&redirect_uri=#{@@fb_redirect_url}"
		http = Net::HTTP.new('graph.facebook.com', 443)
		http.use_ssl = true
		res = http.get(path, nil)
		@access_token = res.body
	end
end