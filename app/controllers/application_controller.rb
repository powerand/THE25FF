class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale
  
  def set_locale
    I18n.locale = cookies["locale"] ||
                  extract_locale_from_accept_language_header ||
                  I18n.default_locale
  end
  
  def redirect_to_films_path
    redirect_to '/films/'
  end
 
  private
  
  def extract_locale_from_accept_language_header
    request.env['HTTP_ACCEPT_LANGUAGE'].try(:scan, /^[a-z]{2}/).try(:first)
  end
end
