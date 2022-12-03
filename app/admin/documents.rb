ActiveAdmin.register Document do
  config.filters = false

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :condo_id, :title, :document_category_id, :content
  #
  # or
  #
  # permit_params do
  #   permitted = [:condo_id, :title, :document_category_id, :content]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end



end
