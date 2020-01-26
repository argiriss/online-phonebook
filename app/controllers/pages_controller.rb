class PagesController < ApplicationController
  def home
    @members = User.members.order(featured: :desc).page(params[:page]).per(6)
  end
end
