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
    id_column
    column :title
    column :class_size
    column :age_from
    column :age_to
    column :status
    actions
  end

  filter :title
  filter :subject
  filter :class_size
  filter :status
  filter :age_from
  filter :age_to

  
  form multipart: true do |f|
    f.inputs do
      f.input :title
      f.input :subtitle
      f.input :subject
      f.input :description
      f.input :class_size
      f.input :status, as: :select,collection: options_for_select(["Active","Inactive"])
      f.input :age_from, as: :select,collection: ((2..11).map {|i| [i,i] })
      f.input :age_to, as: :select,collection: ((2..11).map {|i| [i,i] })
      f.input :cover_photo, as: :file
    end
    f.actions
  end  

    show do
      attributes_table do
        row :title
        row :live_classes_url do
          #link_to resource.title, class_path(resource)
        end
        row :subtitle
        row :subject
        row :description
        row :class_size
        row :status
        row :age_from
        row :age_to
        row :cover_photo do |series|
          if series.cover_photo.attached?
            #image_tag teacher.profile_photo, resize_to_limit: [300, 300], format: :jpeg
            image_tag series.cover_photo, size: "200x200", format: :jpeg
          end
        end
        row :class_instances do
          link_to "Class Instanes"
        end
        active_admin_comments
      end
    end
end

# ActiveAdmin.register ClassSeries do
#   permit_params :title, :subtitle, :subject, :age_from, :age_to, :class_size, :description,
#     :cover_photo, :status
#   preserve_default_filters!
#   remove_filter :instances
#   form partial: "form"
#   index do
#     id_column
#     column :title do |series|
#       link_to series.title, bumo_admin_class_series_path(series)
#     end
#     column :class_size
#     column :age_from
#     column :age_to
#     column :status
#     actions defaults: false do |series|
#       links = []
#       links << link_to('Show', bumo_admin_class_series_path(series), method: :get, "data-turbo": "false")
#       links << link_to('Edit', edit_bumo_admin_class_series_path(series), method: :get, "data-turbo": "false")
#       links << link_to('Delete', bumo_admin_class_series_path(series), method: :delete, data: { confirm: "Are you sure you want to delete this ?" }) if series.instances.count == 0
#       links.join(' ').html_safe
#     end
#   end
#   show do
#     attributes_table do
#       row :title
#       row :live_classes_url do
#         link_to resource.title, class_path(resource)
#       end
#       row :subtitle
#       row :subject
#       row :description
#       row :class_size
#       row :status
#       row :age_from do |series|
#         ClassSeries::AGE_BANDS.invert[series.age_from]
#       end
#       row :age_to do |series|
#         ClassSeries::AGE_BANDS.invert[series.age_to]
#       end
#       row :cover_photo do |series|
#         if series.cover_photo.attached?
#           class_card_image_tag(series)
#         end
#       end
#       row :class_instances do
#         link_to "Class Instanes", bumo_admin_class_instances_path(q: { class_series_id_eq: resource.id })
#       end
#     end
#   end
#   config.action_items.delete_if do |item|
#     item.name == :destroy
#   end
#   action_item :delete, only: :show  do
#     link_to 'Delete Class Series', bumo_admin_class_series_path(resource), method: :delete, data: { confirm: "Are you sure you want to delete this ?" } if resource.instances.count == 0
#   end
#   controller do
#     def update
#       if (resource.status != class_series_status) && class_series_status == "inactive" && resource.instances.future_instances.active.distinct.present?
#         redirect_to bumo_admin_class_series_path(resource),
#           alert: "ERROR: Class Series cannot be marked 'Inactive' because future Class Instances exist. You must first delete/cancel all future Class Instances."
#       else
#         update!
#       end
#     end
#     def destroy
#       if resource.instances.present?
#         redirect_to bumo_admin_class_series_path(resource),
#           alert: "ERROR: Class Series cannot be 'Deleted' because future Class Instances exist. You must first delete all future Class Instances."
#       else
#         destroy!
#       end
#     end
#     def class_series_status
#       params["class_series"]["status"]
#     end
#   end
# end