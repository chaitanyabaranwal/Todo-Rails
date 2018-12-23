class Category < ApplicationRecord
    has_many :tasks

    validates :name, presence: true, length: {minimum: 5}
    validates :description, presence: true, length: {minimum: 10}
end
