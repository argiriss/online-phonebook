class PagesController < ApplicationController
  def home
    @members = User.members
  end
end
