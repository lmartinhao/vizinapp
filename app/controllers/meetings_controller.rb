class MeetingsController < ApplicationController
  before_action :set_meeting, only: %i[show]

  # GET /meetings
  def index
    @meetings = Meeting.all
  end

  # GET /meetings/1
  def show
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
  def set_meeting
    @meeting = Meeting.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def meeting_params
    params.require(:meeting).permit(:user, :area, :schedule_date)
  end
end
