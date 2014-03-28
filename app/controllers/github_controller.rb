class GithubController < ApplicationController
  require 'json'

  @@client_id = "01aa64bd8a13ebc72bb8"
  @@client_secret = "6f0f0ee53401087f6e5aacd0ce6b4e1ddf8d13e3"
  @@redirect_uri = "http://launchp.herokuapp.com/github/resp"
  @@scope = "user"

  def index
    callback_url = params[:return_url]
    redir_uri = get_request_uri callback_url
    url = "https://github.com/login/oauth/authorize?client_id=#{@@client_id}&redirect_uri=#{redir_uri}&scope=#{@@scope}"
    redirect_to url
  end

  def resp
    code = params[:code]
    callback_url = params[:callback_url]
    token = getToken(code, callback_url)
    data = getUser token
    pams = (process_userdata data).to_query
    redirect_to "#{callback_url}?#{pams}"
  end

  private
  def getToken(code, callback_url)
    redir_uri = get_request_uri callback_url
    url = "https://github.com/login/oauth/access_token?client_id=#{@@client_id}&client_secret=#{@@client_secret}&redirect_uri=#{redir_uri}&code=#{code}"
    token = DevController.makeHttpsGetRequest url
    token[token.index("access_token")+13, token.index("token_type")-2]
  end

  def getUser(token)
    url = "https://api.github.com/user?access_token=#{token}"
    DevController.makeHttpsGetRequest url
  end

  def process_userdata(data)
    data = JSON.parse data
    model = {
        :name => data['name'],
        :email => data['email'],
        :picture_url => data['avatar_url'],
        :github_url => data['html_url']
    }
  end

  def get_request_uri(callback_url)
    @@redirect_uri + "?callback_url=#{callback_url}"
  end
end
