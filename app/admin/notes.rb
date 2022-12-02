ActiveAdmin.register Note do

  permit_params :title, :noteDate, :note_category_id, :content, :condo_id, :note_category_id

  form do |f|
    f.object.condo_id = current_user.condo.id
    f.inputs do
      f.input :condo_id, input_html: { value: current_user.condo.id }, as: :hidden
      f.input :title
      f.input :noteDate, as: :date_time_picker
      f.input :note_category, as: :select, collection: NoteCategory.all.collect { |category| [category.name, category.id]}
      f.input :content
    end
    f.actions
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :condo_id, :title, :noteDate, :note_category_id, :content
  #
  # or
  #
  # permit_params do
  #   permitted = [:condo_id, :title, :noteDate, :note_category_id, :content]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  #form partial: "form"
end
