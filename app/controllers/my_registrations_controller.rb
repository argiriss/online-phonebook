class MyRegistrationsController < Devise::RegistrationsController
  def new
    super do |user|
      user.build_contact_detail
    end
  end
end