class StaticPagesController < ApplicationController
	def home

		require "open-uri"
		require 'net/http'


	end

	def fb
		require "open-uri"
		require 'net/http'

		url =  'https://graph.facebook.com/oauth/access_token?client_id=191338297661848&redirect_uri=http://launchp.herokuapp.com/fb&client_secret=e218f0abdb012a0fc8c49e135b8af61d&code=' + params[:code]

		/
		response = Net::HTTP.get_response(URI.parse(url)).body
		/
		
	end
end
