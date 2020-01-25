class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  access all: [:edit, :update], user: :all

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to root_path, notice: 'User was successfully updated.'
      sign_in(@user, bypass: true)
    else
      render :edit
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params[:user].permit!
    end
end
