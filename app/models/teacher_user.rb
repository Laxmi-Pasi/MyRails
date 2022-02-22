class TeacherUser < ApplicationRecord
  has_one_attached :profile_photo
  validates :first_name, :last_name, :email, :bio, :degree,:encrypted_password, presence: true
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  validate :password_requirements_are_met
  validate :check_confirm_password
  private
  def password_requirements_are_met
    rules = {
      " must contain at least one lowercase letter"  => /[a-z]+/,
      " must contain at least one uppercase letter"  => /[A-Z]+/,
      " must contain at least one digit"             => /\d+/,
      " must contain at least one special character" => /[^A-Za-z0-9]+/
    }
  
    rules.each do |message, regex|
      errors.add( :encrypted_password, message ) unless encrypted_password.match( regex )
    end
  end

  def check_confirm_password
    if encrypted_password == reset_password_token
      return true
    end
  end

end 
