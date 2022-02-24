class ChangeColToClassSeries < ActiveRecord::Migration[6.1]
  def change
    change_column :class_series, :status, :integer
  end
end
