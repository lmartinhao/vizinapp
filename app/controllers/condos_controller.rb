class CondosController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[ :new ]

  def index
  end

  def new
    @condo = Condo.new
    @condo.user = User.new
    authorize @condo
  end

  def create
    @condo = Condo.new(condo_params)
    @condo.user.admin = true
    authorize @condo
    if @condo.save
      redirect_to admin_root_path
      flash[:notice] = "Parabéns. Seu condomínio foi cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def condo_params
    params.require(:condo).permit(:name,
                                  :address,
                                  :number,
                                  :city,
                                  :uf_id,
                                  user_attributes: [:user_name,
                                                    :full_name,
                                                    :email,
                                                    :password,
                                                    :password_confirmation])
  end

  def pundit_policy_scoped?
    true
  end
end
