class Category < ApplicationRecord
    has_many :tasks
    belongs_to :user

    validates :name, presence: true, length: {minimum: 5}
    validates :description, presence: true, length: {minimum: 10}
end
