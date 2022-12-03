ActiveAdmin.register Apartament do

  config.filters = false

  scope :apartament, :default => true do |apartaments|
    Apartament.has_condo(current_user.condo.id)
  end

  permit_params :ap_number, :floor, :bedrooms, :square_meters, :garage, :condo_id, :user_id,
                user_attributes: [:user_name, :full_name, :email, :password, :password_confirmation]


  index do
    selectable_column
    id_column
    column :ap_number
    column :floor
    column :bedrooms
    column :square_meters
    column :garage
    column "Login", :user_id do |i|
      i.user.user_name
    end
    column "Email", :user_id do |i|
      i.user.email
    end
    actions
  end

  form do |f|
    if object.new_record?
      f.object.condo_id = current_user.condo.id
      f.inputs do
        f.input :ap_number
        f.input :floor
        f.input :bedrooms
        f.input :square_meters
        f.input :garage

        f.has_many :user, allow_destroy: true, new_record: false do |u|
          u.input :user_name
          u.input :full_name
          u.input :email
          u.input :password
          u.input :password_confirmation
        end
      end
    else
      f.inputs do
        f.input :ap_number
        f.input :floor
        f.input :bedrooms
        f.input :square_meters
        f.input :garage
      end
    end
    f.actions
  end

  controller do

    def new
      @apartament = Apartament.new
      @apartament.user = User.new
    end


    def create
      @apartament = Apartament.new(params.require(:apartament).permit(:ap_number, :floor, :bedrooms, :square_meters, :garage, :condo_id, user_attributes: [:user_name, :full_name, :email, :password, :password_confirmation]))
      @apartament.condo = current_user.condo
      @apartament.save

      super
    end
  end


end
