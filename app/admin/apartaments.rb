ActiveAdmin.register Apartament do

  #scope(:apartament) { |scope| scope.where(garage: true) }

  scope :apartament, :default => true do |apartaments|
    Apartament.has_condo(current_user.condo.id)
  end

  permit_params :ap_number, :floor, :bedrooms, :square_meters, :garage, :condo_id, :user_id,
                user_attributes: [:user_name, :full_name, :email, :password, :password_confirmation]

  filter :garage
  filter :condo_id
  filter :user_id
  filter :have_garage

  index do
    selectable_column
    id_column
    column :ap_number
    column :floor
    column :bedrooms
    column :square_meters
    column :garage
    column :user_name
    column :email
    actions
  end

  form do |f|
    f.object.condo_id = current_user.condo.id
    f.object.user_id = current_user.id
    f.inputs do
      f.input :ap_number
      f.input :floor
      f.input :bedrooms
      f.input :square_meters
      f.input :garage
    end
    f.actions
  end

end
