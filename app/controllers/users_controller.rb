class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :verify_username
  before_action :verify_policy_scoped, only: :verify_username
  before_action :pundit_policy_authorized?, only: :verify_username

  def verify_username
    @username = User.where(user_name: params[:user][:user_name])
    respond_to do |format|
      format.json
    end
  end

  private

  def verify_policy_scoped
    true
  end

  def pundit_policy_authorized?
    true
  end
end
