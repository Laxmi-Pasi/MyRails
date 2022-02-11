class CreateClassSeriesTable < ActiveRecord::Migration[6.1]
  def change
    create_table "class_series", force: :cascade do |t|
      t.string "title"
      t.string "subtitle"
      t.integer "class_size"
      t.text "description"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.integer "age_from"
      t.integer "age_to"
      t.string "subject"
      t.string "status", default: "active", null: false
    end
  end
end
