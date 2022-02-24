class ChangeColInClassSeries < ActiveRecord::Migration[6.1]
  def change
    change_column :class_series, :status, :string
  end
end
