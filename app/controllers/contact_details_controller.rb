class ContactDetailsController < ApplicationController
  before_action :set_contact_detail, only: [:show, :edit, :update, :destroy]
  access user: {except: [:destroy, :edit, :update, :new, :create]}, admin: :all
  before_action :authenticate_user!, only: [:show]

  def index
    @contact_details = ContactDetail.all
  end

  def show
  end

  def new
    @contact_detail = ContactDetail.new
  end

  def edit
  end

  def create
    @contact_detail = ContactDetail.new(contact_detail_params)

    respond_to do |format|
      if @contact_detail.save
        format.html { redirect_to @contact_detail, notice: 'Contact detail was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @contact_detail.update(contact_detail_params)
        format.html { redirect_to @contact_detail, notice: 'Contact detail was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @contact_detail.destroy
    respond_to do |format|
      format.html { redirect_to contact_details_url, notice: 'Contact detail was successfully destroyed.' }
    end
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
                                             :mobile, 
                                             addresses_attributes: [:id, :street_name, :street_number, :city, :country, :postal_code, :name, :_destroy])
    end
end
