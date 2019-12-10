class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    new_session_path(resource_name)
  end

  def after_update_path_for(resource)
    account_page_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar, :avatar_cache, :remove_avatar])
  end
end
