class TwitterController < ApplicationController
  @@tw_callback_url = "http://localhost:3000/twitter/resp"

  def index
    require 'net/http'
    require 'net/https'
    require 'uri'

    uri = URI.parse("https://api.twitter.com/oauth/request_token?oauth_callback=#{@@tw_callback_url}&oauth_consumer_key=uru1XzeUwNf9xTeZUZDXw")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Post.new(uri.path)
    @res = http.request(request).body
  end
end