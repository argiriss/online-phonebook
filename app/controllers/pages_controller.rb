class PagesController < ApplicationController
  def home
    @members = User.members.order(featured: :asc).page(params[:page]).per(10)
  end
end
