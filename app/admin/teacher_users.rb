ActiveAdmin.register TeacherUser do
  menu label: "Teachers"
  #config.filters = false  
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :first_name, :last_name, :email, :bio, :alma_mater, :degree,:profile_photo,:password,:password_confirmation
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
    id_column
    column :name do |user|
      link_to "#{user.first_name} #{user.last_name}", admin_teacher_user_path(user)
    end
    column :email
  end

  filter :first_name
  filter :last_name
  filter :email

  form multipart: true do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :bio
      f.input :alma_mater
      f.input :degree
      f.input :profile_photo, as: :file
      f.input :password
      f.input :password_confirmation, label: "Confirm Password"
      #f.input :reset_password_token, label: "Confirm Password"
    end
    f.actions
  end
  
  show do
    attributes_table do
      row :first_name
      row :last_name
      row :live_classes_url do
        #link_to resource.display_name, teacher_path(resource)
      end
      row :email
      row :bio
      row :alma_mater
      row :degree
      row :google_calendar_id
      row :default_zoom_url
      row :zoom_user_id
      row :profile_photo do |teacher|
        if teacher.profile_photo.attached?
          #image_tag teacher.profile_photo, resize_to_limit: [300, 300], format: :jpeg
          image_tag teacher.profile_photo, size: "200x200", format: :jpeg
        end
      end
      row :class_instances do
        link_to "Class Instances"
      end
      active_admin_comments
    end
  end
  
end


# ActiveAdmin.register TeacherUser do
#   menu label: "Teachers"
#   permit_params :first_name, :last_name, :email, :bio, :alma_mater, :degree,
#     :default_zoom_url, :zoom_user_id, :profile_photo, :password, :password_confirmation
#   remove_filter :class_instances
#   form partial: "form"
#   index do
#     id_column
#     column :name do |user|
#       link_to "#{user.first_name} #{user.last_name}", admin_teacher_user_path(user)
#     end
#     column :email
#   end
#   show do
#     attributes_table do
#       row :first_name
#       row :last_name
#       row :live_classes_url do
#         #link_to resource.display_name, teacher_path(resource)
#       end
#       row :email
#       row :bio
#       row :alma_mater
#       row :degree
#       row :google_calendar_id
#       row :default_zoom_url
#       row :zoom_user_id
#       row :profile_photo do |teacher|
#         if teacher.profile_photo.attached?
#           #image_tag public_variant(teacher.profile_photo, resize_to_limit: [300, 300], format: :jpeg)
#           image_tag teacher.profile_photo, size: "200x200", format: :jpeg
#         end
#       end
#       row :class_instances do
#         link_to "Class Instances", admin_class_instance_path(q: { teacher_id_eq: resource.id })
#       end
#     end
#   end
#   controller do
#     def update
#       if params[:teacher_user][:password].blank?
#         params[:teacher_user].delete("password")
#         params[:teacher_user].delete("password_confirmation")
#       end
#       super
#     end
#   end
# end
