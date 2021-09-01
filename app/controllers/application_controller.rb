class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :name_reading, :address, :phone_number, :datetime, :blood_type_id, :body_weight, :height, :body_temperature, :allergy_id, :chronic_condition_id, :venue_id, :public_uid])
  end

end
