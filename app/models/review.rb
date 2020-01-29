class Review < ApplicationRecord
    validates :content, presence: true
    validates :city, presence: true
    validates :country, presence: true
end
