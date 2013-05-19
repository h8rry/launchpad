class LinkedinController < ApplicationController

  @@app_key = "lb0mu1eenz6v"
  @@secret_key = "5aVToiEvXuUeM4PM"
  @@scope = "r_fullprofile,r_emailaddress"
  @@state = "aLongUniqueStringThatsHardToGuessLolCats"
  @@redirect_uri = "http://launchp.herokuapp.com/linkedin/resp"

  def index
    url = "https://www.linkedin.com/uas/oauth2/authorization?response_type=code&client_id=#{@@app_key}&scope=#{@@scope}&state=#{@@state}&redirect_uri=#{@@redirect_uri}"
    redirect_to url
  end

  def resp
    code = params[:code]
    token = getToken code
    @user = getUser token
  end

  def getToken(code)
    require 'json'

    url = "https://www.linkedin.com/uas/oauth2/accessToken?grant_type=authorization_code&client_id=#{@@app_key}&client_secret=#{@@secret_key}&redirect_uri=#{@@redirect_uri}&code=#{code}"
    token = DevController.makeHttpsGetRequest url
    json = JSON.parse token
    json["access_token"]
  end

  def getUser(token)
    url = "https://api.linkedin.com/v1/people/~?oauth2_access_token=#{token}"
    DevController.makeHttpsGetRequest url
  end

end
