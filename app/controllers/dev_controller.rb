class DevController < ApplicationController
	def user
	
	end
	
	def userCallback
	
	end

	def self.makeHttpsGetRequest(url)
		require 'net/https'
		require 'net/http'
		require 'uri'
		
		uri = URI.parse url
		http = Net::HTTP.new(uri.host, uri.port)
		http.use_ssl = true
		http.verify_mode = OpenSSL::SSL::VERIFY_NONE

		request = Net::HTTP::Get.new(uri.request_uri)
		http.request(request).body
  end

end