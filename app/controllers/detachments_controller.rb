class DetachmentsController < ApplicationController
  def index
    @detachments = Detachment.all
  end

  def new
    @detachment = Detachment.new
  end

  def show
  end

  private

  def pundit_policy_scoped?
    true
  end

  def pundit_policy_authorized?
    true
  end
end
