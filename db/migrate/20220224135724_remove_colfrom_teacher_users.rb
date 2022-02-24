class RemoveColfromTeacherUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :teacher_users, :passowrd
    add_column :teacher_users, :password, :string
  end
end
