class SchedulesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :clean_schedules, only: :index

  def index
    @schedules = []

    start_date = params.fetch(:start_date, Date.today).to_date
    add_notes(start_date)
    @schedules = Schedule.all
  end

  def show
  end

  def update
  end

  def new
    @schedule = Schedule.new
  end

  private

  def add_notes(start_date)
    @notes = Note.where(note_category_id: 1, noteDate: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)

    @notes.each do |note|
      Schedule.create!(
        start_time: note.noteDate,
        end_time: note.noteDate,
        name: note.title,
        kind: "Evento"
      )
    end
  end

  def clean_schedules
    schedules = Schedule.all
    schedules.each do |schedule|
      schedule.destroy
    end
  end

  def pundit_policy_scoped?
    true
  end

  def pundit_policy_authorized?
    true
  end
end
