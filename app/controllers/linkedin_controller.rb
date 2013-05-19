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

    @user = code
  end
end
