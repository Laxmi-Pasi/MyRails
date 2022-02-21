class CreateClassSeries < ActiveRecord::Migration[6.1]
  def change
    create_table :class_series do |t|
      t.string "title"
      t.string "subtitle"
      t.integer "class_size"
      t.text "description"
      t.integer "age_from"
      t.integer "age_to"
      t.string "subject"
      t.string "status", default: "active", null: false
      t.timestamps
    end
  end
end
