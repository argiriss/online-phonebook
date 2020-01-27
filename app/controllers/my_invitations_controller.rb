class MyInvitationsController < Devise::InvitationsController
  before_action :update_sanitized_params, only: :update
  before_action :build_contact_detail, only: :edit

  protected

  def build_contact_detail
    resource.build_contact_detail
  end

  def update_sanitized_params
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [addresses_attributes: [:id, :street_name, :street_number, :city, :country, :postal_code, :name],
                                                                contact_detail_attributes: [:first_name, :last_name, :description, :telephone, :mobile ]])
  end
end