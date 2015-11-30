class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  before_action :restrict_access,:set_locale
  check_authorization


  helper_method :current_user

  rescue_from CanCan::AccessDenied do |exception|
    render json: {message:exception.message},status: 403
  end



  def restrict_access
    authenticate_token || render_unauthorize
  end

  def set_locale
    I18n.locale = current_user.language || I18n.default_locale
  end


  def authenticate_token
    authenticate_with_http_token do |token,options|
      User.find_by(:auth_token => token)
    end
  end

  def render_unauthorize
    self.headers['WWW-Authenticate'] = 'Token realm = "Application"'
    render json:{message:"You are not logged in!"},status: 401
  end

  def current_user
    authenticate_token
  end




end
