class CondosController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new ]

  def index
  end

  def new
    @condo = Condo.new
    authorize @condo
  end

  def create
  end

  def pundit_policy_scoped?
    true
  end
end
