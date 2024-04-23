class ApplicationController < ActionController::Base
  def after_sign_out_path_for(resource_or_scope)
    request.referrer || root_path
  end

  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    { locale: I18n.locale }
  end
end
