class NotesController < ApplicationController
  before_action :set_note, only: %i[show]

  # GET /notes
  def index
    @notes = Note.all
  end

  # GET /notes/1
  def show
    @notes = Note.find(params[:id])
  end

  def new
  end

  private

  def pundit_policy_scoped?
    true
  end

  def pundit_policy_authorized?
    true
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_note
    @note = Note.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def note_params
    params.require(:note).permit(:condo, :title, :noteDate, :note_category, :content)
  end
end
