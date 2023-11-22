class PagesController < ApplicationController
  def splash
    redirect_to  groups_path if current_user
  end
end
