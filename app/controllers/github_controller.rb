class GithubController < ApplicationController

  @@client_id = "01aa64bd8a13ebc72bb8"
  @@client_secret = "6f0f0ee53401087f6e5aacd0ce6b4e1ddf8d13e3"
  @@redirect_uri = "http://launchp.herokuapp.com/github/resp"
  @@scope = "user"

  def index
    url = "https://github.com/login/oauth/authorize?client_id=#{@@client_id}&redirect_uri=#{@@redirect_uri}&scope=#{@@scope}"
    redirect_to url
  end

  def resp
    code = params[:code]
    puts "Response code: #{code}"

    token = getToken code

    puts "Token: #{token}"
    token = token[token.index("access_token")+13, token.index("token_type")-2]

    @user = getUser token

  end

  def getToken(code)
    url = "https://github.com/login/oauth/access_token?client_id=#{@@client_id}&client_secret=#{@@client_secret}&redirect_uri=#{@@redirect_uri}&code=#{code}"
    DevController.makeHttpsGetRequest url
  end

  def getUser(token)
    url = "https://api.github.com/user?access_toke=#{token}"
    DevController.makeHttpsGetRequest url
  end

end
