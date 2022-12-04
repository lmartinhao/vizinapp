ActiveAdmin.register Document do
  config.filters = false
  permit_params :title, :document_category_id, :content, :condo_id, :document_file

  index do
    selectable_column
    id_column
    column :title
    column :content
    column :document_category_id do |i|
      i.document_category.name
    end
    actions
  end

  form do |f|
    f.object.condo_id = current_user.condo.id
    f.inputs do
      f.input :condo_id, input_html: { value: current_user.condo.id }, as: :hidden
      f.input :title
      f.input :content
      f.input :document_category, as: :select, collection: DocumentCategory.all.collect { |category| [category.name, category.id]}
      f.input :document_file, as: :file, pages: true
    end
    f.actions
  end
end
