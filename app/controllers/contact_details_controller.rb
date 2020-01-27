class ContactDetailsController < ApplicationController
  before_action :set_contact_detail, only: [:show]
  before_action :authenticate_user!, only: [:show]

  def show
  end

  private
    def set_contact_detail
      @contact_detail = ContactDetail.find(params[:id])
    end

    def contact_detail_params
      params.require(:contact_detail).permit(:first_name, 
                                             :last_name, 
                                             :description, 
                                             :telephone, 
                                             :mobile)
    end
end
