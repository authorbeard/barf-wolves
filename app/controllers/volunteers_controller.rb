# skipping the old frozen_string_literal magic comment;
# from what I understand, it's no longer necessary in Rails 7

class VolunteersController < ApplicationController
# would likely need some before_actions here, at least
# protect_from_forgery, but I need to refresh my memory here
# and am instead spending time on getting something up and running

  def new

  end

  def create

  end


  private


  def permitted_params
    params.require(:volunteer).permit(:)
  end
end
