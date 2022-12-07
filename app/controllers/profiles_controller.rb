class ProfilesController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def edit
  end



  def update
    if @profile.update(profile_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def pundit_policy_scoped?
    true
  end

  def pundit_policy_authorized?
    true
  end
end
