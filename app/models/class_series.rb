class ClassSeries < ApplicationRecord
    validates :title, :subject, :age_from, :age_to, :status,presence: true
    
    has_one_attached :cover_photo
end
