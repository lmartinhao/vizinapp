class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  before_action :login?, only: %i[ home ]

  def home
  end

  def footer
    render 'show'
  end

  private

  def fixed_footer
    @position = "fixed"
  end

  def login?
    if user_signed_in?
      if current_user.admin?
        redirect_to admin_root_path
      else
        redirect_to apartaments_path
      end
    end
  end
end
