class DetachmentsController < ApplicationController
  before_action :set_detachment, only: %i[ show edit update destroy ]

  def index
    if params[:query].present?
      #sql_query = "title ILIKE :query OR description ILIKE :query"
      sql_query = <<~SQL
        detachments.title @@ :query
        OR detachments.description @@ :query
      SQL
      @detachments = Detachment.where(sql_query, query: "%#{params[:query]}%")
      #raise
    else
      @detachments = Detachment.all
    end
  end

  def show
  end

  def new
    @detachment = Detachment.new
  end

  def create
    @detachment = Detachment.new(detachment_params)
    @detachment.apartament = current_user.apartament
    if @detachment.save
      redirect_to detachments_path
      flash[:notice] = "Seu anuncio foi criado com sucesso"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @detachment.update(detachment_params)
      redirect_to detachment_path(@detachment), notice: "Anúncio alterado com sucesso!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @detachment.destroy
    redirect_to detachments_path, notice: "Anúcio excluido com sucesso!"
  end

  private

  def set_detachment
    @detachment = Detachment.find(params[:id])
  end

  def detachment_params
    params.require(:detachment).permit(:title, :description, :detachment_category_id, :photo)
  end

  def pundit_policy_scoped?
    true
  end

  def pundit_policy_authorized?
    true
  end
end
