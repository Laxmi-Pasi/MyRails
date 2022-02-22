class AddColToTeacherUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :teacher_users, :profile_photo, :string
  end
end
