class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  prorected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: [:nickname, :email, :first_name, :last_name, :first_furigana, :last_furigana, :birth_day]
    )
  end
end
