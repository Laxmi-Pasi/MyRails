class AddColToClassInstances < ActiveRecord::Migration[6.1]
  def change
    add_column :class_instances, :worksheet, :string
  end
end
