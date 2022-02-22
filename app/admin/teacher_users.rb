ActiveAdmin.register TeacherUser do
  config.filters = false  
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :first_name, :last_name, :email, :bio, :alma_mater, :degree,:profile_photo, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :default_zoom_url, :zoom_user_id, :google_calendar_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:first_name, :last_name, :email, :bio, :alma_mater, :degree, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :default_zoom_url, :zoom_user_id, :google_calendar_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
    # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :subtitle, :class_size, :description, :age_from, :age_to, :subject, :status]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :email
    column :bio
    column :degree
    column :encrypted_password
    column :reset_password_token
    actions
  end

  # filter :email
  # filter :current_sign_in_at
  # filter :sign_in_count
  # filter :created_at

  form multipart: true do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :bio
      f.input :degree
      f.input :profile_photo, as: :file
      f.input :encrypted_password, label: "Password"
      #f.input :reset_password_token, label: "Confirm Password"
    end
    f.actions
  end
  
  
end
