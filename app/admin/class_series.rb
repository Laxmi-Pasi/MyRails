ActiveAdmin.register ClassSeries do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :subtitle, :class_size, :description, :age_from, :age_to, :subject, :status, :cover_photo
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
    column :title
    column :subtitle
    column :class_size
    column :description
    column :age_from
    column :age_to
    column :subject
    column :status
    actions
  end

  # filter :email
  # filter :current_sign_in_at
  # filter :sign_in_count
  # filter :created_at

  form multipart: true do |f|
    f.inputs do
      f.input :title
      f.input :subtitle
      f.input :subject
      f.input :description
      f.input :class_size
      f.input :status
      f.input :age_from
      f.input :age_to
      f.input :cover_photo, as: :file
    end
    f.actions
  end
  
end
