ActiveAdmin.register Condo do

  scope :condo, :default => true do |condos|
    Condo.his_condo(current_user.condo.id)
  end

  index do
    selectable_column
    id_column
    column :name
    column :address
    column :number
    column :city
    column :uf_id
    column :user_id
    column :created_at
    actions
  end



  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :address, :number, :city, :uf_id, :user_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :address, :number, :city, :uf_id, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
