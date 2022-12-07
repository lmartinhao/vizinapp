class ApartamentsController < ApplicationController
  def index
    @apartament = policy_scope(Apartament)
    @notes = Note.all
    @last_notes = [@notes[-1], @notes[-2]]
    @schedules = Schedule.all
    @meetings = Meeting.all
  end

  private

  def pundit_policy_scoped?
    true
  end

  def pundit_policy_authorized?
    true
  end
end
