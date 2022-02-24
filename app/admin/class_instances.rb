ActiveAdmin.register ClassInstance do
  config.filters = false  
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :class_series_id, :date,:worksheet, :teacher_id, :_materials_old, :zoom_start_url, :zoom_join_url, :zoom_meeting_id, :google_calendar_event_id, :status
  #
  # or
  #
  # permit_params do
  #   permitted = [:class_series_id, :date, :teacher_id, :_materials_old, :zoom_start_url, :zoom_join_url, :zoom_meeting_id, :google_calendar_event_id, :status]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
    selectable_column
    id_column
    # column :
    # column :subtitle
    # column :class_size
    # column :description
    # column :age_from
    # column :age_to
    # column :subject
    # column :
    actions
  end

  # filter :email
  # filter :current_sign_in_at
  # filter :sign_in_count
  # filter :created_at

  form do |f|
    f.inputs do
      #f.input :class_series_id 
      f.input :class_series_id, as: :select, collection: ClassSeries.all.map { |t| [t.title, t.id]}
      f.input :teacher_id, as: :select, collection: TeacherUser.all.map { |t| [t.first_name + " "+t.last_name, t.id]}
      f.input :date, as: :datepicker
      f.input :_materials_old,label: "Materials"
      f.input :worksheet, as: :file
    end
    f.actions
  end

  9
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
    end
  end

end
