class CondosController < ApplicationController
  before_action :authenticate_user!, except: %i[ new create]
  before_action :login?, only: %i[ new ]

  def index
  end

  def new
    @condo = Condo.new
    @condo.user = User.new
  end

  def create
    @condo = Condo.new(condo_params)
    @condo.user.admin = true
    if @condo.save
      redirect_to new_user_session_path
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

  def pundit_policy_authorized?
    true
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
