ActiveAdmin.register ParentUser do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :stripe_customer_id, :single_access_tokens, :wordpress_user_id, :first_name, :last_name, :phone_number, :time_zone, :email_1h_reminder, :sms_3h_reminder, :sms_10m_reminder
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :stripe_customer_id, :single_access_tokens, :wordpress_user_id, :first_name, :last_name, :phone_number, :time_zone, :email_1h_reminder, :sms_3h_reminder, :sms_10m_reminder]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
    id_column
    column :first_name
    column :last_name
    column :email
    column :phone_number
    column :time_zone
    actions
  end

  filter :first_name
  filter :last_name
  filter :email
  filter :phone_number

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :phone_number
      f.input :time_zone
      f.input :single_access_tokens
      f.input :email_1h_reminder
      f.input :sms_3h_reminder
      f.input :sms_10m_reminder
    end
    f.actions
  end
end
