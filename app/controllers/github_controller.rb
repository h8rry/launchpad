class GithubController < ApplicationController

  @@client_id = "01aa64bd8a13ebc72bb8"
  @@client_secret = "6f0f0ee53401087f6e5aacd0ce6b4e1ddf8d13e3"
  @@redirect_uri = "http://launchp.herokuapp.com/github/resp"
  @@scope = "user"

  def index
    url = "https://github.com/login/oauth/authorize?client_id=#{@@client_id}&@@redirect_uri=#{@@redirect_uri}&scope=#{@@scope}"
    redirect_to url
  end

  def resp
    @code = params[:code]

  end

  def makeHttpsPostRequeset(url)
    require 'net/http'
    require 'net/https'
    require 'uri'

    uri = URI.parse url
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Post.new(uri.path)
    http.request(request).body
  end
end
