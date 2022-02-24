class AddColToClassSeries < ActiveRecord::Migration[6.1]
  def change
    add_column :class_series, :cover_photo, :string
  end
end
