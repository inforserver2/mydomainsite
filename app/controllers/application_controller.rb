class ApplicationController < ActionController::Base
#  include Concerns::ForceNonSSL
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :check_sponsor, :set_locale

  private

  def check_sponsor
    usernames=User.usernames
    sponsor = params[:sponsor]
    if usernames.include? sponsor
      @sponsor=User.where(username: sponsor).first
    else
      url=request.url
      raise "no user" if User.count<1
      redirect_to url_for(sponsor:usernames.first)
    end
  end

  def set_locale
    if params[:locale] && params[:locale]!=session[:locale]
      session[:locale]=params[:locale]
    end
    I18n.locale = session[:locale] || :en
    # current_user.locale
    # request.subdomain
    # request.env["HTTP_ACCEPT_LANGUAGE"]
    # request.remote_ip
  end

  def default_url_options(options = {})
    {:sponsor => params[:sponsor]}
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    # @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end
  helper_method :current_user

  def authorize
    redirect_to login_url, alert: "Not authorized" if current_user.nil?
  end


end
