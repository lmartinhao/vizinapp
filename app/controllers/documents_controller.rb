class DocumentsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @documents = Document.all
  end

  def pundit_policy_scoped?
    true
  end
end
