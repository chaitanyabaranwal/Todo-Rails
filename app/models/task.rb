class Task < ApplicationRecord
    belongs_to :category
    belongs_to :user

    validates :name, presence: true, length: { minimum: 5 }
    validates :category_id, presence: true
    validate :due_date_in_future

    private
    def due_date_in_future
        if !due_date.blank? && due_date < Date.today
            self.errors.add(:due_date, "Due date cannot be in the past")
        end
    end
end
