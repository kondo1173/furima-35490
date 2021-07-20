class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :kanji_firstname, :kanji_lastname, :katakana_firstname, :katakana_lastname, :birthday])
  end
  
end
