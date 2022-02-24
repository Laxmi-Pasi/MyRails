class AddColToTeacherUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :teacher_users, :passowrd, :string
    add_column :teacher_users, :password_confirmation, :string
  end
end
