class MyInvitationsController < Devise::InvitationsController
  before_action :update_sanitized_params, only: :update

  def edit
    super do |user|
      user.build_contact_detail
    end
  end

  protected

  def update_sanitized_params
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [addresses_attributes: [:id, :street_name, :street_number, :city, :country, :postal_code, :name],
                                                                contact_detail_attributes: [:first_name, :last_name, :description, :telephone, :mobile ]])
  end
end