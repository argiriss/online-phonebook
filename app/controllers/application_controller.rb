class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [addresses_attributes: [:id, :street_name, :street_number, :city, :country, :postal_code, :name, :_destroy],
                                                      contact_detail_attributes: [:first_name, :last_name, :description, :telephone, :mobile ]])
  end
end
