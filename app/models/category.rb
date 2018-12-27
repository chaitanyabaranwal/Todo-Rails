class Category < ApplicationRecord
    has_and_belongs_to_many :tasks
    belongs_to :user

    validates :name, presence: true, length: {minimum: 5}
    validates :description, presence: true, length: {minimum: 10}
end
