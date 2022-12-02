ActiveAdmin.register User do

  scope :user, :default => true do |user|
    User.apartaments_user(current_user)
  end

  permit_params :user_name, :full_name, :email, :password, :password_confirmation
  #raise
  index do
    selectable_column
    id_column
    column :user_name
    column :full_name
    column :email
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    if object.new_record?
      f.inputs do
        f.input :user_name
        f.input :full_name
        f.input :email
        f.input :password
        f.input :password_confirmation
      end
    else
      f.inputs do
        f.input :full_name
        f.input :email
        f.input :password
        f.input :password_confirmation
      end
    end
    f.actions
  end

end
