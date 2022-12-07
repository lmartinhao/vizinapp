class ProfilesController < ApplicationController

  def show
    @user = User.find(params[:id])
  end


  private

  def pundit_policy_scoped?
    true
  end

  def pundit_policy_authorized?
    true
  end
end
