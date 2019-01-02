class Task < ApplicationRecord
    has_and_belongs_to_many :categories

    validates :name, presence: true, length: { minimum: 5 }
    validate :due_date_in_future

    private
    def due_date_in_future
        if !due_date.blank? && due_date < Date.today
            self.errors.add(:due_date, "Due date cannot be in the past")
        end
    end
end
