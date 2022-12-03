ActiveAdmin.register Note do
  config.filters = false
  permit_params :title, :noteDate, :note_category_id, :content, :condo_id, :note_category_id

  index do
    selectable_column
    id_column
    column :noteDate, as: "Data"
    column :title, as: "Título"
    column :content
    column :note_category_id do |i|
      i.note_category.name
    end
    actions
  end

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
end
