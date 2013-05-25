class FacebookController < ApplicationController
  require 'json'

  @@app_id = 191338297661848
  @@app_secret = "e218f0abdb012a0fc8c49e135b8af61d"
  @@redirect_uri = "http://launchp.herokuapp.com/facebook/resp/"
  @@scope = "email"


  def index
    callback_url = params[:return_url] #what is this?
    state = callback_url

    puts state

    url = "https://www.facebook.com/dialog/oauth?client_id=#{@@app_id}&scope=#{@@scope}&redirect_uri=#{redir_uri}&state=#{state}"
    
    puts url

    redirect_to url
  end

  def resp
    code = params[:code]
    callback_url = params[:state]
    token = getToken(code, callback_url)
    data = get_user token
    pams = (process_userdata data).to_query
    redirect_to "#{callback_url}?#{pams}"
  end

  private
  def getToken(code, callback_url)
    redir_uri = get_request_uri callback_url

    puts redir_uri

    url = "https://graph.facebook.com/oauth/access_token?client_id=#{@@app_id}&client_secret=#{@@app_secret}&redirect_uri=#{redir_uri}&code=#{code}"

    puts url

    token = DevController.makeHttpsGetRequest url

    puts token 

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
        :gender => data['gender'],
        :picture_url => get_picture_url(data['username']),
        :facebook_url => data['link']
    }
  end

  def get_picture_url(username)
    url = "https://graph.facebook.com/#{username}/picture?type=large&redirect=false"
    data = DevController.makeHttpsGetRequest url
    data = JSON.parse data
    picture_url = data['data']['url']
  end

  def get_request_uri(callback_url)
    @@redirect_uri + "?callback_url=#{callback_url}"
  end

end
