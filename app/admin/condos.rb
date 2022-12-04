ActiveAdmin.register Condo do
  config.filters = false
  actions :all, except: [:new, :destroy]

  scope :condo, :default => true do |condos|
    Condo.his_condo(current_user.condo.id)
  end

  permit_params :name, :address, :number, :city, :uf_id


  index do
    selectable_column
    id_column
    column :name
    column :address
    column :number
    column :city
    column :uf_id do |i|
      i.uf.sigla
    end
    column :created_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :address
      f.input :number
      f.input :city
      f.input :uf_id, as: :select, collection: Uf.all.order(sigla: :desc).collect { |uf| ["#{uf.name}/#{uf.sigla}", uf.id] }
    end
    f.actions
  end

end
