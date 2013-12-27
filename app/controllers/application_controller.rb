class ApplicationController < ActionController::Base
#  include Concerns::ForceNonSSL
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :check_sponsor

  USERS=%w{aaa bbb ccc ddd}


  private

  def default_url_options
      {:sponsor => params[:sponsor]}
  end

  def check_sponsor
    sponsor = params[:sponsor]
    if USERS.include? sponsor
      @sponsor=sponsor
    else
      url=request.url
      raise "no user" if USERS.size<1
      redirect_to url_for(sponsor:USERS.first)
    end
  end

end
