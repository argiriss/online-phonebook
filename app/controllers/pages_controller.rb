class PagesController < ApplicationController
  def home
    @members = User.members.page(params[:page]).per(10)
  end
end
