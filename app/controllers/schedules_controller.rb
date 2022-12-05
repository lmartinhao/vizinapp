class SchedulesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    # Scope your query to the dates being shown:
    start_date = params.fetch(:start_date, Date.today).to_date

    # For a monthly view:
    @schedules = Schedule.where(starts_at: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)

  end

  def show
  end

  def update
  end

  def new
  end

  def pundit_policy_scoped?
    true
  end
end
