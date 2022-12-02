class NotesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
  end

  def pundit_policy_scoped?
    true
  end
end
