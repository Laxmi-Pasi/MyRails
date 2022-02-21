class CreateClassInstances < ActiveRecord::Migration[6.1]
  def change
    create_table :class_instances do |t|
      t.bigint "class_series_id", null: false
      t.datetime "date"
      t.bigint "teacher_id", null: false
      t.string "_materials_old"
      t.string "zoom_start_url"
      t.string "zoom_join_url"
      t.string "zoom_meeting_id"
      t.string "google_calendar_event_id"
      t.string "status", default: "active", null: false
      t.index ["class_series_id"], name: "index_class_instances_on_class_series_id"
      t.index ["teacher_id"], name: "index_class_instances_on_teacher_id"
      t.timestamps
    end
  end
end
