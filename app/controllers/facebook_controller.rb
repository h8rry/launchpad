class FacebookController < ApplicationController
  require 'json'

  @@app_id = 191338297661848
  @@app_secret = "e218f0abdb012a0fc8c49e135b8af61d"
  @@redirect_uri = "http://launchp.herokuapp.com/facebook/resp"
  @@scope = "email"

  # TODO: BIG todo
  @@callback_url = "http://launchp.herokuapp.com/dev/userCallback"

  def index
    url = "https://www.facebook.com/dialog/oauth?client_id=#{@@app_id}&redirect_uri=#{redir_uri}&scope=#{@@redirect_uri}"
    redirect_to url
  end

  def resp
    code = params[:code]
    token = get_token(code, callback_url)
    data = get_user token
    pams = (process_userdata data).to_query
    #redirect_to "#{callback_url}?#{pams}"
    @user = "#{@@callback_url}?#{pams}"
  end

  private
  def get_token(code, callback_url)
    redir_uri = get_request_uri callback_url
    url = "https://graph.facebook.com/oauth/access_token?client_id=#{@@app_id}&client_secret=#{@@app_secret}&code=#{code}&redirect_uri=#{redir_uri}"
    token = DevController.makeHttpsGetRequest url
    token[token.index("access_token")+13, token.index("expires")-2]
  end

  def get_user(token)
    url = "https://graph.facebook.com/me?access_token=#{token}"
    DevController.makeHttpsGetRequest url
  end

  def process_userdata(data)
    data = JSON.parse data
    model = {
        :name => data['name'],
        :email => data['email'],
        :picture_url => data['avatar_url'],
        :facebook_url => data['html_url']
    }
  end

  def get_request_uri(callback_url)
    @@redirect_uri + "?callback_url=#{callback_url}"
    #@@redirect_uri
  end

end
