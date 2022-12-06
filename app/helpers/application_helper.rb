module ApplicationHelper
  def active?(action)
    params[:action] == action ? "active" : nil
  end
end
