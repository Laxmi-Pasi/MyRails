class ParentUser < ApplicationRecord
    validates :first_name, :last_name, :email, :phone_number,presence: true
    validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :phone_number, length: {minimum:10, maximum:11}
end
