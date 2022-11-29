class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def footer
    render 'show'
  end

  private

  def fixed_footer
    @position = "fixed"
  end
end
