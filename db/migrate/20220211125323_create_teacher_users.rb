class CreateTeacherUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :teacher_users do |t|
      t.string "first_name"
      t.string "last_name"
      t.string "email"
      t.string "bio"
      t.string "alma_mater"
      t.string "degree"
      t.string "encrypted_password", default: "", null: false
      t.string "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.string "default_zoom_url"
      t.string "zoom_user_id"
      t.string "google_calendar_id"
      t.index ["email"], name: "index_teacher_users_on_email", unique: true
      t.index ["reset_password_token"], name: "index_teacher_users_on_reset_password_token", unique: true
      t.timestamps
    end
  end
end
