ActiveAdmin.register Area do

  config.filters = false

  scope :area, :default => true do |area|
    Area.has_area(current_user.condo.id)
  end

  permit_params :name, :description, :area_category_id, :condo_id

  index do
    selectable_column
    id_column
    column :name
    column :description
    column "Categoria", :area_category_id do |i|
      i.area_category.name
    end
    actions
  end

  form do |f|
    f.object.condo_id = current_user.condo.id
    f.inputs do
      f.input :condo_id, input_html: { value: current_user.condo.id }, as: :hidden
      f.input :name
      f.input :description
      f.input :area_category, as: :select, collection: AreaCategory.all.collect { |category| [category.name, category.id]}
    end
    f.actions
  end
end
