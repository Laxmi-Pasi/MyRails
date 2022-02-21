class CreateParentUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :parent_users do |t|
      t.string "email", default: "", null: false
      t.string "encrypted_password", default: "", null: false
      t.string "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.string "stripe_customer_id"
      t.integer "single_access_tokens", default: 0, null: false
      t.bigint "wordpress_user_id"
      t.string "first_name"
      t.string "last_name"
      t.string "phone_number"
      t.string "time_zone"
      t.boolean "email_1h_reminder", default: true, null: false
      t.boolean "sms_3h_reminder", default: true, null: false
      t.boolean "sms_10m_reminder", default: true, null: false
      t.index ["email"], name: "index_parent_users_on_email", unique: true
      t.index ["reset_password_token"], name: "index_parent_users_on_reset_password_token", unique: true
      t.index ["wordpress_user_id"], name: "index_parent_users_on_wordpress_user_id", unique: true
      t.timestamps
    end
  end
end
